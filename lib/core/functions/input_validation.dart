import 'package:get/get.dart';

enum InputTypes {
  username,
  email,
  phone,
  password;
}

validateInput(
    {required String value,
    required InputTypes type,
    required String inputName,
    required int max,
    required int min}) {
  if (value.isEmpty) {
    return "The $inputName is required.";
  }

  if (value.length < min) {
    return "$inputName can't be less than $min characters.";
  }

  if (value.length > max) {
    return "$inputName can't be more than $max characters.";
  }

  if (type == InputTypes.username) {
    if (!GetUtils.isUsername(value)) {
      return "Please enter valid username.";
    }
  }

  if (type == InputTypes.email) {
    if (!GetUtils.isEmail(value)) {
      return "Please enter valid email.";
    }
  }

  if (type == InputTypes.phone) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Please enter valid phone number.";
    }
  }
}

validatePassword({required String value, required int max, required int min}) {
  if (value.isEmpty) {
    return "The password is required.";
  }

  if (value.length < min) {
    return "Password can't be less than $min characters.";
  }

  if (value.length > max) {
    return "Password can't be more than $max characters.";
  }
}

validatePasswordAndConfirmation(
    {required String password,
    required String confirmation,
    required String inputName,
    required int max,
    required int min}) {
  if (password.isEmpty) {
    return "The $inputName is required.";
  } else if (password.length < min) {
    return "The $inputName can't be less than $min characters.";
  } else if (password.length > max) {
    return "The $inputName can't be more than $max characters.";
  } else if (password != confirmation) {
    if (inputName == "Password") {
      return "The $inputName and Confirmation not match";
    } else {
      return "The Password and $inputName not match";
    }
  } else {
    return null;
  }
}
