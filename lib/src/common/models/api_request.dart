import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hop_pos/app/api_routes.dart';

class ApiRequest {
  const ApiRequest({required this.path, this.data});
  final String path;
  final Map<String, dynamic>? data;

  String getPath() {
    return "${kReleaseMode ? ApiRoutes.apiProd : ApiRoutes.apiLocal}$path";
  }

  String toJsonData() {
    return jsonEncode(data);
  }
}
