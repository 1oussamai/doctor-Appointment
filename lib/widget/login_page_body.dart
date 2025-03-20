import 'package:doctor_appoitment/constants.dart';
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
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SING IN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('welcome back ! you have been missed'),
              SizedBox(
                height: 80,
              ),
              CustomTextField(
                hintText: 'oussama@example.com',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
