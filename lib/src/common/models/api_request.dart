import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hop_pos/app/api_routes.dart';

class ApiRequest {
  const ApiRequest({
    required this.path,
    this.data,
    this.supressError = false,
  });
  final String path;
  final Map<String, dynamic>? data;
  final bool supressError;

  String getPath() {
    return "${kReleaseMode ? ApiRoutes.apiProd : ApiRoutes.apiLocal}$path";
  }

  String toJsonData() {
    return jsonEncode(data);
  }
}
