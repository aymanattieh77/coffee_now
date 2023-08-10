extension StringEX on String {
  String? validatePhoneNumber(String value) {
    // Regular expression pattern for a basic 10-digit phone number
    // Adjust the pattern based on your specific phone number format
    String pattern = r'^[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  String? validateEmail(String value) {
    // Regular expression pattern for a basic email validation
    // This is a simple pattern, consider using a more comprehensive one for production
    String pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validateUsername(String value) {
    // Regular expression pattern for a basic username validation
    // Adjust the pattern based on your specific requirements
    String pattern = r'^[a-zA-Z0-9_-]{3,20}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Username must be 3-20 characters long and can only contain letters, numbers, underscores, and hyphens';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for uppercase, lowercase, digit, and special character
    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasDigit = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase || !hasLowercase || !hasDigit || !hasSpecialChar) {
      return 'Password must include at least one uppercase letter, one lowercase letter, one digit, and one special character';
    }

    return null;
  }
}
