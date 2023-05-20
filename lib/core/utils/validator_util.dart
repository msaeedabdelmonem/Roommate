class Validator {
  static String? requiredValidator(
      {required String? value, required String key}) {
    if (value == null || value.isEmpty) {
      return '${key.toUpperCase()} ${'مطلوب'}';
    }
    return null;
  }
}
