import 'package:flutter/material.dart';

import 'acceuil.dart';

// import 'pages/home_page.dart';
// import 'pages/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Onboarding App',
      debugShowCheckedModeBanner: false,
      home: OnboardingPage1(), // On commence par l'onboarding
    );
  }
}