import 'package:doctor_appoitment/constants.dart';
import 'package:doctor_appoitment/screens/Sing_up_screen.dart';
import 'package:doctor_appoitment/screens/home_page.dart';
import 'package:doctor_appoitment/widget/costom_bottom.dart';
import 'package:doctor_appoitment/widget/custom_text_field.dart';
import 'package:doctor_appoitment/widget/loging_buttom.dart';
import 'package:doctor_appoitment/widget/loging_with_facebook_and_google.dart';
import 'package:flutter/material.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({
    super.key,
  });

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sing In',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('welcome back ! you have been missed'),
                const SizedBox(
                  height: 80,
                ),
                const Row(
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                CustomTextField(
                  hintText: 'oussama@example.com',
                  validator: confirmEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  hintText: 'Password',
                  suffixIcon: const Icon(Icons.visibility_off),
                  validator: confirmPassword,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget password ?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: kPrimeryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // adding my costum botton

                CostomBottom(
                  text: 'Sing in',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),

                const LogingWithFacebookAndGoogle(),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SingUpScreen();
                        }));
                      },
                      child: const Text("Sing up",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: kPrimeryColor,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? confirmPassword(value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? confirmEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmal\.com$').hasMatch(value)) {
      return 'Email must be a valid @gmal.com address';
    }
    return null;
  }
}
