import 'package:doctor_appoitment/auth/firebase/fire_base_service.dart';
import 'package:doctor_appoitment/constants.dart';
import 'package:doctor_appoitment/screens/home_page.dart';
import 'package:doctor_appoitment/widget/loging_buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogingWithFacebookAndGoogle extends StatefulWidget {
  const LogingWithFacebookAndGoogle({super.key});

  @override
  State<LogingWithFacebookAndGoogle> createState() =>
      _LogingWithFacebookAndGoogleState();
}

FireBaseService authGoogle = FireBaseService();

class _LogingWithFacebookAndGoogleState
    extends State<LogingWithFacebookAndGoogle> {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LogingButtom(
              logo: googleLogo,
              onTap: () async {
                await authGoogle.signInWithGoogle();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const HomePage();
                //     },
                //   ),
                // );
              },
            ),
            const LogingButtom(logo: facebookLogo),
          ],
        ),
      ],
    );
  }
}
