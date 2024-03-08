import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/orders/states/screening_sales_search_state.dart';

class ScreeningsSalesSearchInput extends ConsumerWidget {
  const ScreeningsSalesSearchInput({super.key, this.placeholder});
  final String? placeholder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(screeningSalesSearchStateProvider);

    void onChange(value) {
      EasyDebounce.debounce('screening-search', const Duration(milliseconds: 500), () async {
        ref.read(screeningSalesSearchStateProvider.notifier).set(value);
      });
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FormTextField(
        placeholder: placeholder ?? 'Search',
        value: search,
        onChanged: onChange,
      ),
    );
  }
}
