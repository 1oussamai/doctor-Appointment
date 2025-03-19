import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.yellowAccent,
        )
      ],
    );
  }
}
