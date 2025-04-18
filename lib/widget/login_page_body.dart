import 'package:doctor_appoitment/auth/firebase/fire_base_service.dart';
import 'package:doctor_appoitment/screens/Sing_up_screen.dart';
import 'package:doctor_appoitment/screens/home_page.dart';
import 'package:doctor_appoitment/styles/text_styles.dart';
import 'package:doctor_appoitment/widget/costom_bottom.dart';
import 'package:doctor_appoitment/widget/custom_text_Form_field.dart';
import 'package:doctor_appoitment/widget/loging_with_facebook_and_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  late bool _passwordVisible = true;

  FireBaseService logIn = FireBaseService();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                    height: 50,
                  ),
                  const Text('Sing In', style: Appstyles.primaryText),
                  const Text(
                    'welcome back ! you have been missed',
                    style: Appstyles.subtitleText,
                  ),
                  const SizedBox(
                    height: 40,
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
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget password ?',
                        style: Appstyles.mainText,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // adding my costum botton

                  CostomBottom(
                    text: 'Sing in',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await logIn.logIn(
                            emailController.text, passwordController.text);

                        emailController.clear();
                        passwordController.clear();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 50,
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
                        child: const Text(
                          "Sing up",
                          style: Appstyles.mainText,
                        ),
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
