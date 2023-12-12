import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Activate POS License',
                style: context.textTheme.headlineLarge!.copyWith(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brand500,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Welcome to HOP POS, please sign in with your administrator account and POS license key to begin.',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.gray900,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
