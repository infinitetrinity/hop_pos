import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/form_search_input.dart';
import 'package:hop_pos/src/common/widgets/search_list.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/customers/states/customers_search_state.dart';
import 'package:hop_pos/src/customers/widgets/customer_tile.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class CustomerSearchInput extends HookConsumerWidget {
  const CustomerSearchInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TypeAheadField<CustomerWithRegistration>(
      suggestionsCallback: (search) => ref.read(customersSearchStateProvider(search).future),
      builder: (context, controller, focusNode) {
        focusNode.requestFocus();
        return FormSearchTextInput(
          controller: controller,
          focusNode: focusNode,
          label: 'Search Customer',
        );
      },
      listBuilder: (context, children) => SearchList(children),
      itemBuilder: (context, customer) => CustomerTile(customer),
      emptyBuilder: (context) => Container(
        padding: const EdgeInsets.all(12),
        color: AppColors.white,
        width: double.infinity,
        child: Text(
          'No Customer found',
          style: AppStyles.body,
        ),
      ),
      onSelected: (customer) {
        ref.read(posControllerProvider.notifier).setCustomer(customer);
      },
    );
  }
}
