class AppValidationService {
  static String? validateRequired(String? value, {String fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required.";
    }
    return null;
  }
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required.";
    }
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address.";
    }
    return null;
  }
}
