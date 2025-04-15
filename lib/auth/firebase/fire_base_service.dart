import 'dart:developer';

import 'package:doctor_appoitment/helper/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseService {
  singUp(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      ToastShow.showToast("Created successfully", Colors.green[300]!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ToastShow.showToast("email already used", Colors.red);
      }
    } catch (e) {
      ToastShow.showToast("Something went wrong", Colors.red[200]!);
    }
  }

  logIn(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      ToastShow.showToast("Logged in successfully", Colors.green[300]!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ToastShow.showToast("no user found for this email", Colors.red[200]!);
        ToastShow.showToast(
            e.message ?? "Authentication failed", Colors.red[200]!);
        log("$e");
      } else if (e.code == 'wrong-password') {
        ToastShow.showToast("wrong password", Colors.red[200]!);
      }
    } catch (e) {
      ToastShow.showToast("Something went wrong", Colors.red[200]!);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    ToastShow.showToast("Created successfully", Colors.green[300]!);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
