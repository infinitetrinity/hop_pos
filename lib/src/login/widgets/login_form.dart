import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/form_button.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/login/models/login_request.dart';

class LoginForm extends HookWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isSubmitting = useState(false);
    final form = useState(const LoginRequest());

    void onSubmit() {
      isSubmitting.value = true;

      if (formKey.currentState!.validate()) {
        //submit
      }

      isSubmitting.value = false;
    }

    return Expanded(
      flex: 4,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 550),
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Activate POS License',
                style: AppStyles.h1.copyWith(color: AppColors.brand600),
              ),
              const SizedBox(height: 15),
              Text(
                'Welcome to HOP POS, please sign in with your administrator account and POS license key to begin.',
                style: AppStyles.body,
              ),
              const SizedBox(height: 25),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    FormTextField(
                      isRequired: true,
                      placeholder: 'License Key',
                      validator: (value) =>
                          form.value.validateField('License Key', value),
                    ),
                    const SizedBox(height: 10),
                    FormTextField(
                      isRequired: true,
                      placeholder: 'Username',
                      validator: (value) =>
                          form.value.validateField('Username', value),
                    ),
                    const SizedBox(height: 10),
                    FormTextField(
                      isRequired: true,
                      isPassword: true,
                      placeholder: 'Password',
                      validator: (value) =>
                          form.value.validateField('Password', value),
                    ),
                    const SizedBox(height: 20),
                    FormButton(
                      maxWidth: null,
                      isSubmitting: isSubmitting.value,
                      onSubmit: onSubmit,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
