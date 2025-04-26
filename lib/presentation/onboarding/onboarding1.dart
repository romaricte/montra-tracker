import 'package:flutter/material.dart';
import 'package:montra_tracker/core/constants/image_constants.dart';
import 'package:get/get.dart';


class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  // Contrôleur pour gérer le PageView
  final PageController _pageController = PageController();
  // Index de la page actuelle
  int _currentPage = 0;

  // Liste des données pour chaque page d'onboarding
  final List<Map<String, String>> _onboardingData = [
    {
      'image': ImageConstants.onboarding1,
      'title': 'Gain total control\nof your money',
      'subtitle': 'Become your own money manager and make every cent count',
    },
    {
      'image': ImageConstants.onboarding2, // Remplacer par la deuxième image
      'title': 'Know where your\nmoney goes',
      'subtitle': 'Track your transactions easily, with categories and financial report',
    },
    {
      'image': ImageConstants.onboarding3, // Remplacer par la troisième image
      'title': 'Planning ahead',
      'subtitle': 'Setup your budget for each category so youre in control',
    },
  ];

  @override
  void dispose() {
    // Libérer les ressources du contrôleur
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtenir les dimensions de l'écran pour un design responsive
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Barre d'état (simulée)
              const SizedBox(height: 12),
              
              // Zone de défilement avec PageView
              Expanded(
                flex: 5,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Image.asset(
                        _onboardingData[index]['image']!,
                        width: size.width * 0.9,
                      ),
                    );
                  },
                ),
              ),
              
              // Indicateurs de page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                  (index) => Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: _currentPage == index 
                          ? const Color(0xFF7F3DFF) // Violet actif
                          : const Color(0xFFEEE5FF), // Violet clair inactif
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Texte principal
              Text(
                _onboardingData[_currentPage]['title']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212325),
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 16),
              
              // Sous-titre
              Text(
                _onboardingData[_currentPage]['subtitle']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF91919F),
                  height: 1.2,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Bouton d'inscription ou bouton suivant
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Si on est sur la dernière page, naviguer vers l'inscription
                    // Sinon, passer à la page suivante
                    if (_currentPage == _onboardingData.length - 1) {
                      Get.toNamed('/register');
                      // Navigation vers l'écran d'inscription
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7F3DFF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    _currentPage == _onboardingData.length - 1 ? 'S\'inscrire' : 'Suivant',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              // Bouton de connexion (visible uniquement sur la dernière page)
              Visibility(
                visible: _currentPage == _onboardingData.length - 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigation vers l'écran de connexion
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEEE5FF),
                        foregroundColor: const Color(0xFF7F3DFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Se connecter',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}