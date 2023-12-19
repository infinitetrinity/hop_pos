import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'last_synced_at') DateTime? lastSyncedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static String get table {
    return 'users';
  }
}
