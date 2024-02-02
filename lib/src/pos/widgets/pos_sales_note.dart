import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosSalesNote extends ConsumerWidget {
  const PosSalesNote({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesNote = ref.watch(posControllerProvider.select((prov) => prov.order?.order.salesNote));

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      color: AppColors.white,
      child: FormTextField(
        placeholder: 'Add sales note...',
        value: salesNote,
        minLines: 2,
        maxLines: 2,
        keyboardType: TextInputType.multiline,
        isRequired: true,
        onChanged: (value) {
          EasyDebounce.debounce('pos-sales-note', const Duration(milliseconds: 500), () async {
            ref.read(posControllerProvider.notifier).setSalesNote(value);
          });
        },
      ),
    );
  }
}
