import 'package:flutter/material.dart';

class LogingButtom extends StatelessWidget {
  const LogingButtom({super.key, required this.logo});

  final String logo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(logo),
    );
  }
}
