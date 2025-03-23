import 'package:flutter/material.dart';

class LogingWithFacebookAndGoogle extends StatelessWidget {
  const LogingWithFacebookAndGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(thickness: 1, color: Colors.grey[300])),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("OR Login with"),
            ),
            Expanded(child: Divider(thickness: 1, color: Colors.grey[300])),
          ],
        ),
        

      ],
    );
  }
}
