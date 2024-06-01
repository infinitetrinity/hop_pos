import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/models/validation_errors.dart';
import 'package:hop_pos/src/common/widgets/error_text.dart';
import 'package:hop_pos/src/common/widgets/form_button.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/login/controllers/login_controller.dart';
import 'package:hop_pos/src/login/models/login_request.dart';

class ReauthenticateForm extends HookConsumerWidget {
  const ReauthenticateForm({
    required this.onSubmit,
    super.key,
  });
  final Future<void> Function(LoginRequest request) onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isSubmitting = useState(false);
    final form = useState(const LoginRequest());
    final errors = useState<ValidationErrors?>(null);

    void handleSubmit() async {
      errors.value = null;
      isSubmitting.value = true;

      if (formKey.currentState!.validate()) {
        await onSubmit(form.value);
      }

      if (context.mounted) {
        isSubmitting.value = false;
      }
    }

    ref.listen(loginControllerProvider, (_, state) {
      if (!state.isLoading && state.error is ApiValidationError) {
        errors.value = (state.error as ApiValidationError).errors;
        formKey.currentState?.validate();
        return;
      }
    });

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
                'Login with CRM',
                style: AppStyles.h1.copyWith(color: AppColors.brand600),
              ),
              const SizedBox(height: 15),
              Text(
                'Your token has expired, please login using your CRM account to continue. This will require internet connection.',
                style: AppStyles.body,
              ),
              const SizedBox(height: 25),
              ErrorText(errors.value?.getError('general')),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    FormTextField(
                      isRequired: true,
                      placeholder: 'Username',
                      value: '',
                      validator: (value) => errors.value != null
                          ? errors.value!.getError('username')
                          : form.value.validateField('Username', value),
                      onChanged: (value) {
                        form.value = form.value.copyWith(username: value);
                      },
                    ),
                    const SizedBox(height: 10),
                    FormTextField(
                      isRequired: true,
                      isPassword: true,
                      placeholder: 'Password',
                      value: '',
                      validator: (value) => errors.value != null
                          ? errors.value!.getError('password')
                          : form.value.validateField('Password', value),
                      onChanged: (value) {
                        form.value = form.value.copyWith(password: value);
                      },
                    ),
                    const SizedBox(height: 20),
                    FormButton(
                      maxWidth: null,
                      isSubmitting: isSubmitting.value,
                      onSubmit: handleSubmit,
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
