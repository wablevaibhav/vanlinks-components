class Validations {
  static String? validateEmail(String? value) {
    var passNonNullValue = value ?? "";
    RegExp reg = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (passNonNullValue.isEmpty) {
      return 'Please enter some text';
    } else if (!passNonNullValue.contains("@")) {
      return ("Email should contains @");
    } else if (!reg.hasMatch(passNonNullValue)) {
      return ("Email is not valid");
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    var passNonNullValue = value ?? "";
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length <= 8) {
      return ("Password Must be more than 8 characters");
    } else if (!regex.hasMatch(passNonNullValue)) {
      return ("Password should contain upper,lower,digit and Special character ");
    }
    return null;
  }

  static String? nameValidation(String? value) {
    var nameNonNullValue = value ?? "";
    RegExp regExp = RegExp(r'^[a-zA-Z]*$');
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (!regExp.hasMatch(nameNonNullValue)) {
      return ("No number and special characters allowed.");
    }
    return null;
  }

  static String? addressValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  static String? mobileValidation(String? value) {
    RegExp regExp = RegExp(r'^\d{10}$');
    var phoneNonNullValue = value ?? "";

    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (!regExp.hasMatch(phoneNonNullValue)) {
      return ("Only 10 digit allowed");
    }
    return null;
  }

  static String? requireField(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }

    return null;
  }
}
