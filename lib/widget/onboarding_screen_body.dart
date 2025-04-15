// ignore_for_file: dead_code

import 'package:doctor_appoitment/auth/firebase/auth_page.dart';
import 'package:doctor_appoitment/constants.dart';
import 'package:doctor_appoitment/screens/login_page.dart';
import 'package:doctor_appoitment/widget/intro_body.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({
    super.key,
  });

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: controller,
          children: const [
            IntroBody(
              image: 'assets/images/docters-Photoroom2.png',
              text: 'this appllicatio',
              subtitle: 'now we are goin to discover',
            ),
            IntroBody(
              image: 'assets/images/Appointment-Photoroom.png',
              text: 'this appllicatio',
              subtitle: 'now we are goin to discover',
            ),
            IntroBody(
              image: 'assets/images/Schedule-Photoroom.png',
              text: 'this appllicatio',
              subtitle: 'now we are goin to discover',
            ),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.75),
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.nextPage(
                duration: Duration(milliseconds: 50), curve: Curves.bounceIn);
          },
          child: Container(
            alignment: const Alignment(0.7, 0.75),
            child: Text(
              'next',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const AuthPage();
              }),
            );
          },
          child: Container(
            alignment: const Alignment(0.8, -0.85),
            child: const Text(
              'skip',
              style: TextStyle(
                fontSize: 20,
                color: kMainColor,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
