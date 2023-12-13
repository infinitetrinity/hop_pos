class ValidationErrors {
  const ValidationErrors({required this.errors});

  final Map<String, dynamic> errors;

  List<String> getErrors(String field) {
    return errors[field];
  }

  String? getError(String field) {
    return errors[field] == null ? null : errors[field][0];
  }
}
