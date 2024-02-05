import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/form_search_input.dart';
import 'package:hop_pos/src/common/widgets/search_list.dart';
import 'package:hop_pos/src/customers/controllers/customer_controller.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/customers/widgets/customer_tile.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CustomerSearchInput extends HookConsumerWidget {
  const CustomerSearchInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TypeAheadField<CustomerWithRegistration>(
      suggestionsCallback: (search) => ref.read(customerControllerProvider.notifier).search(search),
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
      onSelected: (item) async {
        context.loaderOverlay.show();
        await ref
            .read(posControllerProvider.notifier)
            .selectCustomer(customer: item.customer, registration: item.registration);
        if (context.mounted) {
          context.loaderOverlay.hide();
        }
      },
    );
  }
}
