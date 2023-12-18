import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/common/models/api_response.dart';
import 'package:hop_pos/src/users/models/user.dart';

class LoginResponse extends ApiResponse {
  final ApiResponse res;

  LoginResponse(this.res) : super(res.response);

  String get token {
    return data['access_token'];
  }

  User get user {
    return User.fromJson(data['user']).copyWith(accessToken: token);
  }

  UsersTableCompanion get userData {
    return UsersTableCompanion(
      id: Value(user.id),
      fullName: Value(user.fullName),
      accessToken: Value.ofNullable(user.accessToken),
    );
  }
}
