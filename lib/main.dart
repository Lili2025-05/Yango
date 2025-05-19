import 'package:flutter/material.dart';

import 'acceuil.dart';
import 'welcome_page';

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
      title: 'Yango-App',
      debugShowCheckedModeBanner: false,
      home: IntroVideoPage(), // On commence par l'onboarding
    );
  }
}