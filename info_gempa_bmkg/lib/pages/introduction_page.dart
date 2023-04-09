import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title of blue page",
          body:
              "Welcome to the app! This is a description on a page with a blue background.",
          image: Center(
            child: Lottie.asset("assets/lotties/info.json"),
          ),
          decoration: const PageDecoration(
              // pageColor: Colors.white,
              ),
        ),
        PageViewModel(
          title: "Title of blue page",
          body:
              "Welcome to the app! This is a description on a page with a blue background.",
          image: Center(
            child: Lottie.asset("assets/lotties/weather.json"),
          ),
          decoration: const PageDecoration(
              // pageColor: Colors.white,
              ),
        )
      ],
      showNextButton: true,
      next: const Text("Next"),
      done: const Text(
        'Done',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
  }
}
