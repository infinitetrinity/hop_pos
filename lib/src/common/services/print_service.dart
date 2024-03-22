import 'package:flutter/services.dart';
import 'package:flutter_pos_printer_platform/esc_pos_utils_platform/src/capability_profile.dart';
import 'package:flutter_pos_printer_platform/esc_pos_utils_platform/src/enums.dart';
import 'package:flutter_pos_printer_platform/esc_pos_utils_platform/src/generator.dart';
import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/company/models/company.dart';
import 'package:hop_pos/src/company/states/company_state.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_payments/models/order_payment_with_method.dart';
import 'package:hop_pos/src/payment_methods/actions/payment_method_actions.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/models/pos_cart.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_setting.dart';
import 'package:hop_pos/src/receipt_settings/states/receipt_setting_state.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_timeslots/actions/screening_timeslot_actions.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screenings/actions/screening_actions.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'print_service.g.dart';

@riverpod
Future<PrintService> printService(PrintServiceRef ref) async {
  return PrintService(
    screeningActions: ref.watch(screeningActionsProvider),
    screeningTimeslotActions: ref.watch(screeningTimeslotActionsProvider),
    paymentMethodActions: ref.watch(paymentMethodActionsProvider),
    cart: ref.watch(posControllerProvider),
    company: await ref.watch(companyStateProvider.future),
    receiptSetting: await ref.watch(receiptSettingStateProvider.future),
  );
}

class PrintService {
  final ScreeningActions screeningActions;
  final ScreeningTimeslotActions screeningTimeslotActions;
  final PaymentMethodActions paymentMethodActions;
  final PosCart cart;
  final Company? company;
  final ReceiptSetting? receiptSetting;

  PrintService({
    required this.screeningActions,
    required this.screeningTimeslotActions,
    required this.paymentMethodActions,
    required this.cart,
    required this.company,
    required this.receiptSetting,
  });

  Future<dynamic> printPdf(Page page, {bool toPreview = false}) async {
    final info = await Printing.info();
    if (!info.canPrint || !info.directPrint || !info.canListPrinters) {
      return false;
    }

    final printer = (await Printing.listPrinters()).firstWhere((el) => el.isDefault);
    if (!printer.isAvailable) {
      return false;
    }

    try {
      final document = Document();
      document.addPage(page);

      if (toPreview) {
        return PdfPreview(
          build: (format) => document.save(),
        );
      }

      await Printing.directPrintPdf(
        usePrinterSettings: true,
        printer: printer,
        onLayout: (_) => document.save(),
      );

      return true;
    } catch (exception) {
      print('Print error $exception');
    }

    return false;
  }

  Future<bool> printReceipt(Page page) async {
    PrinterDevice? printer;
    PrinterManager.instance.discovery(type: PrinterType.usb).listen((device) {
      printer = device;
    });

    final connected = printer == null
        ? false
        : await PrinterManager.instance.connect(
            type: PrinterType.usb,
            model: UsbPrinterInput(
              name: printer!.name,
              productId: printer!.productId,
              vendorId: printer!.vendorId,
            ),
          );

    if (!connected) {
      return false;
    }

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);

    try {
      final document = Document();
      document.addPage(page);
      final pages = Printing.raster(await document.save());
      List<int> bytes = [];

      await for (var page in pages) {
        final image = page.asImage();
        bytes += generator.image(image);
        bytes += generator.feed(2);
        bytes += generator.cut();
      }

      PrinterManager.instance.send(type: PrinterType.usb, bytes: bytes);

      return true;
    } catch (exception) {
      print('Print error $exception');
    } finally {
      await PrinterManager.instance.disconnect(type: PrinterType.usb);
    }

    return false;
  }

  Future<bool> printCustomerRegistrationLabel(Customer customer, ScreeningRegistration? registration) async {
    final timeslot = registration != null ? await screeningTimeslotActions.getById(registration.timeslotId) : null;
    final data = await rootBundle.load("assets/fonts/Inter-SemiBold.ttf");
    final textStyle = TextStyle(
      font: Font.ttf(data),
      letterSpacing: 0,
      fontSize: 8,
    );

    final page = Page(
      pageFormat: PdfPageFormat.a4,
      margin: const EdgeInsets.all(10),
      build: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SN: ${registration?.index ?? customer.nricIndex}",
            style: textStyle,
          ),
          Text(
            "Name: ${customer.fullName}",
            style: textStyle,
          ),
          Text(
            "NRIC: ${customer.nric}",
            style: textStyle,
          ),
          Text(
            "Date Screened: ${timeslot?.displayDate ?? ''}",
            style: textStyle,
          ),
        ],
      ),
    );

    return await printPdf(page);
  }

  Future<bool> printOrderReceipt() async {
    print('printing receipt');
    if (cart.order == null) {
      return false;
    }

    final font = await rootBundle.load("assets/fonts/Inter-Regular.ttf");
    final fontBold = await rootBundle.load("assets/fonts/Inter-SemiBold.ttf");

    final textStyle = TextStyle(
      font: Font.ttf(font),
      letterSpacing: 0,
      fontSize: 8,
      fontFallback: [
        Font.times(),
      ],
    );
    final textStyleBold = textStyle.copyWith(
      font: Font.ttf(fontBold),
      fontWeight: FontWeight.bold,
    );

    final page = Page(
      pageFormat: PdfPageFormat.roll80,
      margin: const EdgeInsets.all(5),
      build: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _printRefNo(textStyleBold),
          _printCompany(textStyle, textStyleBold),
          _printScreening(textStyle),
          _printOrderItems(textStyle),
          _printCartTotal(textStyle, textStyleBold),
          _printOrderPayments(textStyle),
          _printBalanceAndChange(textStyleBold),
          _printFooter(textStyle),
        ],
      ),
    );

    return await printReceipt(page);
  }

  Future<bool> printUtfStfReceipt() async {
    print('printing utf/stf receipt');
    if (cart.screening == null) {
      return false;
    }

    final font = await rootBundle.load("assets/fonts/Inter-Regular.ttf");
    final fontBold = await rootBundle.load("assets/fonts/Inter-SemiBold.ttf");
    final closestTimeslot = await screeningActions.getScreeningNearestTimeslot(cart.screening!);

    final textStyle = TextStyle(
      font: Font.ttf(font),
      letterSpacing: 0,
      fontSize: 8,
      fontFallback: [
        Font.times(),
      ],
    );
    final textStyleBold = textStyle.copyWith(
      font: Font.ttf(fontBold),
      fontWeight: FontWeight.bold,
    );

    final page = Page(
      pageFormat: PdfPageFormat.roll80,
      margin: const EdgeInsets.all(5),
      build: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _printSpecimentHeader(textStyle, textStyleBold),
          _printSpecimentVenue(closestTimeslot, textStyleBold),
          _printSpecimentNotice(textStyle, textStyleBold),
          _printSpecimentUtf(textStyle, textStyleBold),
          _printSpecimentStf(textStyle, textStyleBold),
        ],
      ),
    );

    return await printReceipt(page);
  }

  Widget _printSpecimentHeader(TextStyle textStyle, TextStyle textStyleBold) {
    if (receiptSetting == null) {
      return Container();
    }

    return Column(
      children: [
        Text(
          receiptSetting?.outstandingSpecimenTitle ?? 'Outstanding Specimen',
          textAlign: TextAlign.center,
          style: textStyleBold.copyWith(
            fontSize: 20,
          ),
        ),
        _printDottedLine(),
        if (company != null) ...[
          Text(
            company!.name,
            style: textStyleBold,
          ),
          Text(
            'Helpline Tel: ${company!.telephone}',
            style: textStyleBold,
          ),
          _printDottedLine(),
        ],
      ],
    );
  }

  Widget _printSpecimentVenue(ScreeningTimeslot timeslot, TextStyle textStyleBold) {
    if (timeslot.specimenCollectionVenue == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date: ${DateFormat('dd MMM yyyy').format(timeslot.specimenCollectionDate ?? DateTime.now())}',
          style: textStyleBold.copyWith(
            fontSize: 20,
          ),
        ),
        Text(
          'Time: ${timeslot.specimenCollectionTime}',
          style: textStyleBold.copyWith(
            fontSize: 20,
          ),
        ),
        Text(
          'Venue: ${timeslot.specimenCollectionVenue}',
          style: textStyleBold.copyWith(
            fontSize: 20,
          ),
        ),
        _printDottedLine(),
      ],
    );
  }

  Widget _printSpecimentNotice(TextStyle textStyle, TextStyle textStyleBold) {
    if (receiptSetting == null) {
      return Container();
    }

    return Column(
      children: [
        Text(
          receiptSetting!.outstandingSpecimenNoticeTitle ?? '',
          style: textStyleBold,
        ),
        SizedBox(height: 5),
        Text(
          receiptSetting!.outstandingSpecimenNotice ?? '',
          textAlign: TextAlign.center,
          style: textStyle,
          softWrap: true,
        ),
        _printDottedLine(),
      ],
    );
  }

  Widget _printSpecimentUtf(TextStyle textStyle, TextStyle textStyleBold) {
    if (receiptSetting == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            receiptSetting!.utfTitle ?? '',
            style: textStyleBold,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 5),
        Text(
          receiptSetting!.utfNotice ?? '',
          style: textStyle,
        ),
        _printDottedLine(),
      ],
    );
  }

  Widget _printSpecimentStf(TextStyle textStyle, TextStyle textStyleBold) {
    if (receiptSetting == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            receiptSetting!.stfTitle ?? '',
            style: textStyleBold,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 5),
        Text(
          receiptSetting!.stfNotice ?? '',
          style: textStyle,
        ),
        _printDottedLine(),
      ],
    );
  }

  Widget _printRefNo(TextStyle textStyleBold) {
    return Center(
      child: Text(
        "REF: ${cart.registration?.index ?? cart.customer?.nricIndex}",
        style: textStyleBold.copyWith(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _printCompany(TextStyle textStyle, TextStyle textStyleBold) {
    if (company == null) {
      return Container();
    }
    return Column(
      children: [
        Text(
          company!.name,
          style: textStyleBold,
        ),
        if (!company!.address.isNullOrEmpty)
          Text(
            company!.address!,
            style: textStyle,
          ),
        if (!company!.postalCode.isNullOrEmpty)
          Text(
            "Singapore ${company!.postalCode!}",
            style: textStyle,
          ),
        if (!company!.coRegistrationNo.isNullOrEmpty)
          Text(
            "Biz Reg No. ${company!.coRegistrationNo!}",
            style: textStyle,
          ),
        if (!company!.telephone.isNullOrEmpty)
          Text(
            "Tel: ${company!.telephone!}",
            style: textStyle,
          ),
        _printDottedLine(),
        Text(
          "HOP Medical Centre",
          style: textStyle,
        ),
        Text(
          "Palais Renaissance",
          style: textStyle,
        ),
        Text(
          "390 Orchard Road #11-04 S238871",
          style: textStyle,
        ),
        Text(
          "Tel: 6589 0009",
          style: textStyle,
        ),
        _printDottedLine(),
      ],
    );
  }

  Widget _printScreening(TextStyle textStyle) {
    if (cart.screening == null || cart.order?.order == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (cart.customer != null)
          Text(
            cart.customer!.fullName,
            style: textStyle,
          ),
        Text(
          cart.screening!.name,
          style: textStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Date: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}",
              style: textStyle,
            ),
            Text(
              "Time: ${DateFormat('hh:mm a').format(DateTime.now())}",
              style: textStyle,
            ),
          ],
        ),
        Text(
          "Receipt No.: ${cart.order!.order.displayInvoiceNo}",
          style: textStyle,
        ),
        _printDottedLine(),
      ],
    );
  }

  Widget _printOrderItems(TextStyle textStyle) {
    if (cart.order?.items == null) {
      return Container();
    }

    final items = cart.order!.items ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Item",
              style: textStyle,
            ),
            Text(
              "Amount",
              style: textStyle,
            ),
          ],
        ),
        _printDottedLine(),
        for (OrderItem item in items)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      item.name,
                      style: textStyle,
                    ),
                  ),
                  SizedBox(width: 5),
                  SizedBox(
                    width: 40,
                    child: Text(
                      item.displayNetPrice,
                      style: textStyle,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              Text(
                "(${item.sku})",
                style: textStyle,
              ),
              if (item.hasDiscount)
                Text(
                  'was ${item.displayPrice} (${item.displayDiscount} discount)',
                  style: textStyle,
                ),
              if (items.last != item) SizedBox(height: 5),
            ],
          ),
        _printDottedLine(),
      ],
    );
  }

  Widget _printCartTotal(TextStyle textStyle, TextStyle textStyleBold) {
    if (cart.order == null) {
      return Container();
    }

    final order = cart.order!.order;

    return Column(
      children: [
        _printCost('Subtotal:', cart.order!.subtotal.formatMoney, textStyle),
        if (order.hasDiscount)
          _printCost(
            'Discount ${order.isDiscountPercentage ? "(${(order.discount ?? 0).removeZeroDecimal()}%):" : ":"}',
            "-${cart.order!.cartDiscount.formatMoney}",
            textStyle,
          ),
        _printOrderExtras(textStyle),
        _printCost('Rounding:', cart.order!.rounding.formatMoney, textStyle),
        _printCost('Total:', cart.order!.total.formatMoney, textStyleBold),
        _printDottedLine(),
      ],
    );
  }

  Widget _printOrderExtras(TextStyle textStyle) {
    if (cart.order?.extras == null) {
      return Container();
    }

    final extras = cart.order!.extras ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (OrderExtra extra in extras)
          _printCost(
            "${extra.displayName}:",
            "${extra.isAddType ? '' : '-'} ${(extra.calculatedAmount ?? 0).formatMoney}",
            textStyle,
          ),
      ],
    );
  }

  Widget _printOrderPayments(TextStyle textStyle) {
    if (cart.order?.payments == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (OrderPaymentWithMethod item in (cart.order!.payments ?? []))
          if (item.method != null)
            _printCost(
              "${item.method!.name} Paid: ",
              (item.payment.amount ?? 0).formatMoney,
              textStyle,
            ),
      ],
    );
  }

  Widget _printBalanceAndChange(TextStyle textStyle) {
    if (cart.order == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (cart.order!.balance > 0) _printCost('Balance:', (cart.order!.balance).formatMoney, textStyle),
        if (cart.order!.change > 0) _printCost('Change:', (cart.order!.change).formatMoney, textStyle),
        _printDottedLine(),
      ],
    );
  }

  Widget _printFooter(TextStyle textStyle) {
    if (receiptSetting?.footerText == null) {
      return Container();
    }

    return Column(
      children: [
        SizedBox(height: 5),
        Text(
          receiptSetting!.footerText!,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _printCost(String label, String amount, TextStyle textStyle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: textStyle,
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(width: 20),
        SizedBox(
          width: 70,
          child: Text(
            amount,
            style: textStyle,
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }

  Widget _printDottedLine({
    double height = 1,
    Color color = AppColors.gray800,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints?.constrainWidth() ?? 100;
        const dashWidth = 3.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: PdfColor.fromHex(color.hex)),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
