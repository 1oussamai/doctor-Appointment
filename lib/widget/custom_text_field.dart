import 'package:doctor_appoitment/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hintText,
  });
final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.green,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimeryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimeryColor),
        ),
      ),
    );
  }
}