import 'package:hop_pos/src/common/models/api_response.dart';
import 'package:hop_pos/src/users/models/user.dart';

class LoginResponse extends ApiResponse {
  final ApiResponse res;

  LoginResponse(this.res) : super(res.response);

  String get token {
    return data['access_token'];
  }

  User get user {
    return User.fromJson(super.data['user']).copyWith(accessToken: token);
  }
}
