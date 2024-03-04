import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:intl/intl.dart';

part 'screening_with_sales_data.freezed.dart';
part 'screening_with_sales_data.g.dart';

@freezed
class ScreeningWithSalesData with _$ScreeningWithSalesData {
  const factory ScreeningWithSalesData({
    required Screening screening,
    required int salesCount,
    required double salesTotal,
    required double paymentTotal,
    required int stfCount,
    required int utfCount,
    required DateTime lastSalesAt,
  }) = _ScreeningWithSalesData;

  const ScreeningWithSalesData._();

  factory ScreeningWithSalesData.fromJson(Map<String, dynamic> json) => _$ScreeningWithSalesDataFromJson(json);

  String get displayLastSalesAt {
    return DateFormat('dd MMM yyyy, hh:mm a').format(lastSalesAt);
  }
}
