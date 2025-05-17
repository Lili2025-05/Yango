import 'package:flutter/material.dart';

import '../components/oneboarding.dart';
// import '../components/onboarding_page.dart'; // ⬅️ importe ton widget

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page d\'accueil')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            OnboardingPage1(), // ⬅️ ton widget utilisé ici
            SizedBox(height: 20),
            Text('Contenu supplémentaire après l\'onboarding'),
          ],
        ),
      ),
    );
  }
}
