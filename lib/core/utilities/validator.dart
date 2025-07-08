import 'package:intl/intl.dart';
class Validator {
  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    } else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null; // Validation passed
  }

  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters long";
    } else if (!RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    ).hasMatch(value)) {
      return "Password must include uppercase, lowercase, number, and special character";
    }
    return null;
  }









static String formatCustomDate(DateTime time) {
  return DateFormat('d MMM, hh:mm a').format(time);
}
}
