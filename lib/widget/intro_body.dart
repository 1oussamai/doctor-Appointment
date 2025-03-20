import 'package:flutter/material.dart';

class IntroBody extends StatelessWidget {
  const IntroBody(
      {super.key,
      required this.image,
      required this.text,
      required this.subtitle});
  final String image;
  final String text;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(
            height: 22,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0XFF0165FC)),
          ),
          Text(subtitle),
        ],
      ),
    );
  }
}
