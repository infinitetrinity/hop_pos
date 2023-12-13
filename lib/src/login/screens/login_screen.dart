import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/login/widgets/login_background.dart';
import 'package:hop_pos/src/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: const Row(
          children: [
            LoginBackground(),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
