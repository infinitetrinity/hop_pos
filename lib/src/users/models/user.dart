import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required int id,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'last_synced_at') DateTime? lastSyncedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static String get table {
    return 'users';
  }

  UsersTableCompanion toData() {
    return UsersTableCompanion(
      id: drift.Value(id),
      fullName: drift.Value(fullName),
      lastSyncedAt: drift.Value(lastSyncedAt),
    );
  }
}
