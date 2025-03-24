import 'package:doctor_appoitment/constants.dart';
import 'package:flutter/material.dart';

abstract class Appstyles {
  static const primaryText = TextStyle(
    fontSize: 25,
    color: kPrimeryColor,
    fontWeight: FontWeight.bold,
  );
  static const subtitleText = TextStyle(
    color: kSecendryColor,
  );
  static const mainText = TextStyle(
    decoration: TextDecoration.underline,
    color: kMainColor,
    fontWeight: FontWeight.w600,
  );
}
