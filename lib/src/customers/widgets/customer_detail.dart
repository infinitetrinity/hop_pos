import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/customers/widgets/edit_customer_dialog.dart';
import 'package:hop_pos/src/customers/widgets/empty_customer.dart';
import 'package:hop_pos/src/customers/widgets/selected_customer_detail.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class CustomerDetail extends HookConsumerWidget {
  const CustomerDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    final isEditHover = useState(false);
    final customer =
        ref.watch(posControllerProvider.select((prov) => prov.customer));

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: Container(
        decoration: BoxDecoration(
          color: isEditHover.value
              ? AppColors.yellow500
              : isHover.value
                  ? AppColors.brand600
                  : AppColors.white,
          border: const Border(
            top: BorderSide(color: AppColors.gray300),
            bottom: BorderSide(color: AppColors.gray300),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.account_circle_rounded,
                color: isHover.value ? AppColors.white : AppColors.gray800,
                size: 28,
              ),
            ),
            if (customer == null) ...[
              EmptyCustomer(isHover: isHover.value),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Icon(
                  Icons.warning_rounded,
                  color: isHover.value ? AppColors.white : AppColors.yellow500,
                  size: 30,
                ),
              ),
            ],
            if (customer != null) ...[
              SelectedCustomerDetail(isHover: isHover.value),
              GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => const EditCustomerDialog(),
                ),
                child: MouseRegion(
                  onEnter: (_) => isEditHover.value = true,
                  onExit: (_) => isEditHover.value = false,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 12),
                    child: Icon(
                      Icons.edit_note_sharp,
                      color:
                          isHover.value ? AppColors.white : AppColors.gray700,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
