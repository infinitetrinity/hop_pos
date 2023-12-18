import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/users/models/user.dart';
import 'package:hop_pos/src/users/models/users_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [UsersTable])
class UserDao extends DatabaseAccessor<AppDb> with _$UserDaoMixin {
  UserDao(AppDb db) : super(db);

  Future<User> insertUser(UsersTableCompanion user) async {
    return await into(usersTable).insertReturning(user);
  }

  Future<bool> updateUser(
      UsersTableCompanion user, Expression<bool> where) async {
    final count = await (update(usersTable)..where((_) => where)).write(user);
    return count > 0;
  }
}
