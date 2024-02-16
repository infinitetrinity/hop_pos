import 'package:flutter/services.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_timeslots/actions/screening_timeslot_actions.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'print_service.g.dart';

@riverpod
PrintService printService(PrintServiceRef ref) {
  return PrintService(
    screeningTimeslotActions: ref.watch(screeningTimeslotActionsProvider),
  );
}

class PrintService {
  final ScreeningTimeslotActions screeningTimeslotActions;

  PrintService({
    required this.screeningTimeslotActions,
  });

  Future<bool> printDoc(Page page) async {
    final info = await Printing.info();
    if (!info.canPrint || !info.directPrint || !info.canListPrinters) {
      return false;
    }

    final printer = (await Printing.listPrinters()).firstWhere((el) => el.isDefault);
    if (!printer.isAvailable) {
      return false;
    }

    try {
      print('prining');
      final document = Document();
      document.addPage(page);

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

    return await printDoc(page);
  }

  Future<bool> printOrderReceipt() async {
    return false;
  }
}
