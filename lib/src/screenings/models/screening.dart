import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';

part 'screening.freezed.dart';
part 'screening.g.dart';

@freezed
class Screening with _$Screening {
  const factory Screening({
    required int id,
    required String name,
    String? corporate,
  }) = _Screening;

  const Screening._();

  factory Screening.fromJson(Map<String, dynamic> json) => _$ScreeningFromJson(json);

  static List<Screening> fromJsonList(dynamic data) {
    return List<Screening>.from(
      data.map((el) => Screening.fromJson(el)),
    );
  }

  ScreeningsTableCompanion toData() {
    return ScreeningsTableCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      corporate: drift.Value(corporate),
    );
  }
}
