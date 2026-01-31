//Utility class for validating I will call this in UI
class Validators {
  Validators._();

  /// Email validation
  /// Returns error message if invalid, null if valid
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid Email Address';
    }
    return null;
  }

  /// Password validation
  /// - Minimum 5 characters
  /// - Must include uppercase letter
  /// - Must include a number
  /// - Must include a symbol
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 5) {
      return 'Password must be at least 5 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Must include uppercase';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Must include a number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Must include a symbol';
    }
    return null;
  }

  /// Confirm password validation
  /// Checks if passwords match
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value.length < 5) {
      return 'Password must be at least 5 characters';
    }
    if (value != password) {
      return 'Passwords must match';
    }
    return null;
  }

  /// Username validation
  /// Minimum 2 characters
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 Characters';
    }
    return null;
  }

  /// Password strength checks for UI indicators
  static bool hasMinLength(String password) => password.length >= 5;
  static bool hasUppercase(String password) =>
      RegExp(r'[A-Z]').hasMatch(password);
  static bool hasNumber(String password) => RegExp(r'[0-9]').hasMatch(password);
  static bool hasSymbol(String password) =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
}
