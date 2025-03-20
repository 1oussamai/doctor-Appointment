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
    return Stack(children: [
      PageView(
        controller: controller,
        children: const [
          IntroBody(
            image: 'assets/images/docters-Photoroom.png',
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
      )
    ]);
  }
}
