import 'package:flutter/material.dart';

class CommonStyle {
  static InputDecoration textFieldStyle(
      {String labelText = "", String hintText = "", String? value}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(12),
      labelText: labelText,
      hintText: hintText,
      labelStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(246, 86, 203, 209)),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(246, 86, 203, 209)),
        borderRadius: BorderRadius.circular(12),
      ),
      // fillColor: Colors.grey[200],
      filled: true,
    );
  }

  static InputDecoration textFieldStyle2(
      {String labelText = "", Icon? prefixIcon, IconButton? suffixIcon}) {
    return InputDecoration(
      prefixIcon: prefixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(color: Colors.cyan, width: 2.0)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(color: Colors.cyan, width: 2.0)),
      filled: true,
      suffixIcon: suffixIcon
    );
  }
}

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
    return passwordRegExp.hasMatch(this);
  }

  bool isNull(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidAddress {
    final phoneRegExp = RegExp(
        r"^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z ]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z0-9-_ ]*$");

    return phoneRegExp.hasMatch(this);
  }

  bool get isValidCode {
    final phoneRegExp = RegExp(r"^[A-Z0-9]*$");
    return phoneRegExp.hasMatch(this);
  }

//putting* allow Null !!
//+ one or more
  bool get isValidNumber {
    final phoneRegExp = RegExp(r"^[0-9]+$");
    return phoneRegExp.hasMatch(this);
  }
}
