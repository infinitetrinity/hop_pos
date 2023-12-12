import 'package:flutter/material.dart';
import 'package:hop_pos/src/login/widgets/login_background.dart';
import 'package:hop_pos/src/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          LoginBackground(),
          LoginForm(),
        ],
      ),
    );
  }
}
