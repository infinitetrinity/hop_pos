import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/users/daos/user_dao.dart';
import 'package:hop_pos/src/users/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepo(UserRepoRef ref) {
  return UserRepository(
    userDao: ref.watch(appDbProvider.select((prov) => prov.userDao)),
  );
}

class UserRepository {
  final UserDao userDao;

  UserRepository({
    required this.userDao,
  });

  Future<User> insert(UsersTableCompanion user) {
    return userDao.insertUser(user);
  }

  Future<bool> update(UsersTableCompanion user, Expression<bool> where) {
    return userDao.updateUser(user, where);
  }
}