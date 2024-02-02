import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/services/overlay_portal_hook.dart';
import 'package:hop_pos/src/customers/widgets/customer_detail.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/widgets/pos_customer_controls.dart';

class PosCustomer extends HookConsumerWidget {
  const PosCustomer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useOverlayPortalController();
    final link = LayerLink();
    final width = useState<double?>(null);

    ref.listen(posControllerProvider.select((prov) => prov.customer), (_, current) {
      controller.hide();
    });

    return CompositedTransformTarget(
      link: link,
      child: OverlayPortal(
        controller: controller,
        overlayChildBuilder: (BuildContext context) => CompositedTransformFollower(
          link: link,
          targetAnchor: Alignment.bottomLeft,
          child: PosCustomerControls(
            width: width.value,
            onClicked: () => controller.hide(),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            width.value = context.size?.width;
            controller.toggle();
          },
          child: const CustomerDetail(),
        ),
      ),
    );
  }
}
