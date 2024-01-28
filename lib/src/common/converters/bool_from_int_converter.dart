import 'package:freezed_annotation/freezed_annotation.dart';

class BoolFromIntConverter implements JsonConverter<bool, int> {
  const BoolFromIntConverter();

  @override
  bool fromJson(int json) => json == 1;

  @override
  int toJson(bool object) => object == true ? 1 : 0;
}
