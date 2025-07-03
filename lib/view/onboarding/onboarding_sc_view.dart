import 'package:flutter/material.dart';

class OnboardingScView extends StatefulWidget {
  const OnboardingScView({super.key});

  @override
  State<OnboardingScView> createState() => _OnboardingScViewState();
}

class _OnboardingScViewState extends State<OnboardingScView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("onboarding")));
  }
}
