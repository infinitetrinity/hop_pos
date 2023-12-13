import 'dart:convert';

import 'package:flutter/foundation.dart';

class ApiRequest {
  static const String localApiBase = 'http://hopsg.local/api/v3/';
  static const String prodApiBase = 'http://hopsg.local/api/v3/';

  const ApiRequest({required this.path, this.data});
  final String path;
  final Map<String, dynamic>? data;

  String getPath() {
    return "${kReleaseMode ? prodApiBase : localApiBase}}/$path";
  }

  String toJsonData() {
    return jsonEncode(data);
  }
}
