import 'package:doctor_appoitment/auth/firebase/auth_page.dart';
import 'package:doctor_appoitment/auth/firebase/fire_base_service.dart';
import 'package:doctor_appoitment/constants.dart';
import 'package:doctor_appoitment/screens/home_page.dart';
import 'package:doctor_appoitment/widget/costom_bottom.dart';
import 'package:doctor_appoitment/widget/custom_text_Form_field.dart';
import 'package:doctor_appoitment/widget/loging_with_facebook_and_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUpBody extends StatefulWidget {
  const SingUpBody({super.key});

  @override
  State<SingUpBody> createState() => _SingUpBodyState();
}

class _SingUpBodyState extends State<SingUpBody> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;

  late bool _passwordVisible = false;
  FireBaseService regesrter = FireBaseService();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Fill information below or register\n  with your social account',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const CustomTextField(
                    hintText: 'Your name',
                  ),
                  const SizedBox(
                    height: 20,
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
                    controller: emailController,
                    hintText: 'example@gmail.com',
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
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: _passwordVisible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    validator: confirmPassword,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // adding my costum botton

                  CostomBottom(
                    text: 'Sing up',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        singUp();
                  
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
                          Navigator.pop(context);
                        },
                        child: const Text("Sing in",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: kMainColor,
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
      ),
    );
  }

  void singUp() async {
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await regesrter.singUp(email, password);
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
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(value)) {
      return 'Email must be a valid @gmal.com address';
    }
    return null;
  }
}
