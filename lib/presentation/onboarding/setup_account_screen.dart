import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:montra_tracker/core/utils/colors.dart'; // Supposant que vous avez un fichier pour les couleurs

class SetupAccountScreen extends StatefulWidget {
  const SetupAccountScreen({super.key});

  @override
  State<SetupAccountScreen> createState() => _SetupAccountScreenState();
}

class _SetupAccountScreenState extends State<SetupAccountScreen> {
  @override
  Widget build(BuildContext context) {
    // Fonction pour convertir une chaîne hexadécimale en Color
    Color hexToColor(String hexString) {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    }

    return Scaffold(
      backgroundColor: Colors.white, // fill_ZW28GC: '#FFFFFF'
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Vous pouvez ajouter une icône de retour ou d'autres éléments ici si nécessaire
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Titre
              Text(
                'Let’s setup your account!',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 36,
                  color: hexToColor('#212325'), // fill_82DCD3
                ),
              ),
              const SizedBox(height: 24),
              // Sous-titre
              Text(
                'Account can be your bank, credit card or \nyour wallet.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: hexToColor('#292B2D'), // fill_B5HLIL
                ),
              ),
              const Spacer(), // Pour pousser le bouton vers le bas
              // Bouton "Let's go"
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hexToColor('#7F3DFF'), // fill_4V5Z0H
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(
                      '/addNewAccount',
                    ); // For example, navigate to next screen
                  },
                  child: Text(
                    'Let’s go',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: hexToColor('#FCFCFC'), // fill_XE312I
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
