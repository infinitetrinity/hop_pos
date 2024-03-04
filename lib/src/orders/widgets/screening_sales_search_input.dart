import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/orders/states/screening_sales_search_state.dart';

class ScreeningSalesSearchInput extends ConsumerWidget {
  const ScreeningSalesSearchInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(screeningSalesSearchStateProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FormTextField(
        placeholder: 'Search Screening',
        value: search,
        onChanged: (value) => ref.read(screeningSalesSearchStateProvider.notifier).set(value),
      ),
    );
  }
}
