class Validation {
  // validate required fields
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    // Add specific validations here if needed
    return null;
  }

  // validate email for sign up page
  // email shouldn't be exist before
  static String? validateEmailSignUp(
      String? value, String fieldName, bool showEmailExist) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (!emailRegex.hasMatch(value)) {
      return "Invalid Email";
    } else if (showEmailExist) {
      return "Email already exists";
    }
    return null;
  }

  //validate email for login page
  // email should be exist
  static String? validateEmailLogin(
      String? value, String fieldName, bool showEmailNotExist) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (!emailRegex.hasMatch(value)) {
      return "Invalid Email";
    } else if (showEmailNotExist) {
      return 'Email doesn\'t exists';
    }
    return null;
  }

  // validate password while 'sign up'
  //and while reset password #not done yet
  static String? validatePassword(String? value, String fieldName) {
    RegExp minLengthRegex = RegExp(r'^.{8,}$');

    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (!minLengthRegex.hasMatch(value)) {
      return "Password should be at least 8 characters";
    }
    return null;
  }

  // validate confirm password
  static String? validateConfirmPassword(
      String? value, String? password, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (value != password) {
      return 'Confirm Password doesn\'t Match Password ';
    }
    return null;
  }
}
