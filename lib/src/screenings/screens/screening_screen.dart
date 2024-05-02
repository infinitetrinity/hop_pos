import 'package:flutter/material.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/common/widgets/server_connection_status.dart';
import 'package:hop_pos/src/customers/actions/customer_actions.dart';
import 'package:hop_pos/src/customers/widgets/customer_info_dialog.dart';
import 'package:hop_pos/src/screenings/widgets/screening_search_input.dart';
import 'package:hop_pos/src/screenings/widgets/screenings_list.dart';
import 'package:hop_pos/src/screenings/widgets/selected_screening.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScreeningScreen extends HookConsumerWidget {
  const ScreeningScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = useState(false);

    void onBarcodeScanned(String barcode) async {
      if (barcode.isNullOrEmpty || !isVisible.value) {
        return;
      }

      barcode = barcode.trim().replaceAll(RegExp(r"\s+"), "");
      context.loaderOverlay.show();
      final result = await ref.read(customerActionsProvider).findCustomerDetail(barcode);

      if (context.mounted) {
        context.loaderOverlay.hide();

        if (result == null) {
          ref
              .read(flashMessageProvider)
              .flash(message: 'Customer not found with code scanned: ($barcode)', type: FlashMessageType.error);
          return;
        }

        showDialog(
          context: context,
          builder: (_) => CustomerInfoDialog(customer: result),
        );
      }
    }

    return Layout(
      VisibilityDetector(
        onVisibilityChanged: (VisibilityInfo info) {
          isVisible.value = info.visibleFraction > 0;
        },
        key: const Key('visible-detector-key'),
        child: BarcodeKeyboardListener(
          bufferDuration: const Duration(seconds: 2),
          onBarcodeScanned: onBarcodeScanned,
          useKeyDownEvent: true,
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 780,
                child: Column(
                  children: [
                    ScreeningSearchInput(),
                    SizedBox(height: 30),
                    ScreeningsList(),
                  ],
                ),
              ),
              SizedBox(width: 30),
              Flexible(
                child: Column(
                  children: [
                    SelectedScreening(),
                    SizedBox(height: 20),
                    ServerConnectionStatus(),
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
