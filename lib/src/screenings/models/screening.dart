import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening.freezed.dart';
part 'screening.g.dart';

@freezed
class Screening with _$Screening {
  const factory Screening({
    required int id,
    required String name,
    String? corporate,
  }) = _Screening;

  factory Screening.fromJson(Map<String, dynamic> json) =>
      _$ScreeningFromJson(json);

  static List<Screening> fromJsonList(dynamic data) {
    return List<Screening>.from(
      data.map((el) => Screening.fromJson(el)),
    );
  }

  static String get table {
    return 'screenings';
  }
}
