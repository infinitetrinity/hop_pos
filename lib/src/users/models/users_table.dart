import 'package:drift/drift.dart';
import 'package:hop_pos/src/users/models/user.dart';

@UseRowClass(User)
class UsersTable extends Table {
  @override
  String get tableName => 'users';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text().withLength(max: 255)();
  TextColumn get accessToken => text().withLength(max: 255)();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
}
