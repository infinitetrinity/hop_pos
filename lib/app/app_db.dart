import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:hop_pos/src/users/daos/user_dao.dart';
import 'package:hop_pos/src/users/models/user.dart';
import 'package:hop_pos/src/users/models/users_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_db.g.dart';

@Riverpod(keepAlive: true)
AppDb appDb(AppDbRef ref) {
  final db = AppDb.instance;
  ref.onDispose(() => db.close());
  return db;
}

@DriftDatabase(tables: [
  UsersTable,
], daos: [
  UserDao,
])
class AppDb extends _$AppDb {
  AppDb._init() : super(initDb());
  static final AppDb instance = AppDb._init();

  @override
  int get schemaVersion => 1;
  static const String name = "hop_pos.sqlite";

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> deleteDb() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, name));
    await file.delete();
  }

  static LazyDatabase initDb() {
    print('opening database');
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, name));
      return NativeDatabase.createInBackground(file);
    });
  }

  Stream<int> count(table, countExp) async* {
    final query = selectOnly(table)..addColumns([countExp]);
    final result = query.map((row) => row.read(countExp)).watchSingle();

    await for (final value in result) {
      yield value == null ? 0 : int.parse(value.toString());
    }

    yield 0;
  }
}
