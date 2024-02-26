import 'package:hop_pos/src/users/actions/user_actions.dart';
import 'package:hop_pos/src/users/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';

@Riverpod(keepAlive: true)
Future<User?> authState(AuthStateRef ref) async {
  return await ref.read(userActionsProvider).getFirst();
}
