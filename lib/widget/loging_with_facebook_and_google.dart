import 'package:doctor_appoitment/constants.dart';
import 'package:doctor_appoitment/widget/loging_buttom.dart';
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("OR Login with"),
            ),
            Expanded(child: Divider(thickness: 1, color: Colors.grey[300])),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LogingButtom(logo: googleLogo),
            LogingButtom(logo: facebookLogo),
          ],
        ),
      ],
    );
  }
}
