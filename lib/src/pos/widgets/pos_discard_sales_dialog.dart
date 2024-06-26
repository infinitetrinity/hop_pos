import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/common/widgets/dialog_footer.dart';
import 'package:hop_pos/src/common/widgets/dialog_title.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosDiscardSalesDialog extends HookConsumerWidget {
  const PosDiscardSalesDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSubmitting = useState(false);

    Future<void> discardSales() async {
      isSubmitting.value = true;
      await ref.read(posControllerProvider.notifier).discardSales();
      isSubmitting.value = false;

      if (context.mounted) {
        context.pop();
        ref.read(flashMessageProvider).flash(message: 'Successfully discarded sale.');
      }
    }

    return Center(
      child: Container(
        color: AppColors.white,
        width: 600,
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DialogTitle(
              title: 'Discard Sales',
              color: AppColors.red600,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Are you sure you want to discard this sales?',
                    style: AppStyles.bodyLarge,
                  ),
                  Text(
                    'This action cannot be reversed.',
                    style: AppStyles.bodyLarge,
                  ),
                  const SizedBox(height: 30),
                  DialogFooter(
                    isSubmitting: isSubmitting.value,
                    onSubmit: discardSales,
                    color: AppColors.red500,
                    submitLabel: 'Confirm',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
