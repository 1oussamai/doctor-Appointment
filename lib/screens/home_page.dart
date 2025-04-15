import 'package:doctor_appoitment/helper/toast.dart';
import 'package:doctor_appoitment/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Home page'),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: const Text("sing out"),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              signOutUser(context);
            },
            child: Container(
              height: 20,
              width: 20,
              child: const Text('sing out'),
            ),
          )
        ],
      ),
    );
  }

  Future<void> signOutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      ToastShow.showToast("✅ Signed out successfully!", Colors.green);

      GoogleSignIn googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
        ToastShow.showToast("✅ Signed out successfully!", Colors.green);
      }
    } catch (e) {
      ToastShow.showToast("✅ Signed out successfully!", Colors.green);
    }
  }

 
}
