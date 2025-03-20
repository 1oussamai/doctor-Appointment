import 'package:doctor_appoitment/constants.dart';
import 'package:doctor_appoitment/screens/home_page.dart';
import 'package:doctor_appoitment/widget/costom_bottom.dart';
import 'package:doctor_appoitment/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
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
              const CustomTextField(
                hintText: 'oussama@example.com',
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
              const CustomTextField(
                hintText: 'Password',
                suffixIcon: Icon(Icons.visibility_off),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
