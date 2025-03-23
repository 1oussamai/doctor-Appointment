import 'package:flutter/material.dart';

class LogingButtom extends StatelessWidget {
  const LogingButtom({super.key, required this.logo, this.onTap});

  final String logo;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffE6E6E6),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset(logo),
      ),
    );
  }
}
