import 'package:doctor_appoitment/constants.dart';
import 'package:flutter/material.dart';

class CostomBottom extends StatelessWidget {
  const CostomBottom({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kMainColor,
        ),
        height: 60,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
