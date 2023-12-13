import 'dart:convert';

class ApiRequest {
  static const String apiBase = 'http://hopsg.local/api/v3/';
  const ApiRequest({required this.path, this.data});
  final String path;
  final Map<String, dynamic>? data;

  String getPath() {
    return "$apiBase/$path";
  }

  String toJsonData() {
    return jsonEncode(data);
  }
}
