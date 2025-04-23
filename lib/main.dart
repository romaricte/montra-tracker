import 'package:flutter/material.dart';
import 'presentation/onboarding/onboarding1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Point d'entrée principal de l'application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Montra Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7F3DFF)),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      home: const Onboarding1(), // Afficher l'écran d'onboarding comme page d'accueil
    );
  }
}
