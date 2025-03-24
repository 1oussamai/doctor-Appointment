import 'package:doctor_appoitment/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.validator,
    this.controller,
  });
  final String hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Colors.white70,
        hintText: hintText,
        filled: true,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: kMainColor),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kMainColor),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
