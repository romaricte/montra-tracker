import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Contrôleurs pour les champs de texte
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // État pour le champ de mot de passe
  bool _obscurePassword = true;
  bool _termsAccepted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Barre de navigation supérieure
            _buildTopNavigation(),
            
            // Contenu principal avec défilement
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    
                    // Titre de la page
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7F3DFF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFCFCFC),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Champ de nom
                    _buildInputField(
                      controller: _nameController,
                      hintText: 'Name',
                      suffixIcon: null,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Champ d'email
                    _buildInputField(
                      controller: _emailController,
                      hintText: 'Email',
                      suffixIcon: null,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Champ de mot de passe
                    _buildInputField(
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: _obscurePassword,
                      suffixIcon: IconButton(
                        icon: SizedBox(
                          width: 24,
                          height: 24,
                          child: Stack(
                            children: [
                              Image.asset('assets/images/eye_icon_1.svg'),
                              Image.asset('assets/images/eye_icon_2.svg'),
                            ],
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Case à cocher pour les conditions
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _termsAccepted = !_termsAccepted;
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: _termsAccepted ? const Color(0xFF7F3DFF) : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: const Color(0xFF7F3DFF),
                                width: 2,
                              ),
                            ),
                            child: _termsAccepted
                                ? const Icon(
                                    Icons.check,
                                    size: 16,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'By signing up, you agree to the Terms of Service and Privacy Policy',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Bouton d'inscription
                    _buildButton(
                      text: 'Sign Up',
                      backgroundColor: const Color(0xFF7F3DFF),
                      textColor: Colors.white,
                      onPressed: () {
                        // Logique d'inscription
                      },
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Séparateur "Or with"
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Or with',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF91919F),
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Bouton Google
                    _buildButton(
                      text: 'Sign Up with Google',
                      backgroundColor: const Color(0xFFFCFCFF),
                      textColor: const Color(0xFF212325),
                      borderColor: const Color(0xFFF1F1FA),
                      icon: _buildGoogleIcon(),
                      onPressed: () {
                        // Logique de connexion avec Google
                      },
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Lien vers la page de connexion
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigation vers la page de connexion
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF212325),
                            ),
                            children: [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF7F3DFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Construction de la barre de navigation supérieure
  Widget _buildTopNavigation() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF212325),
            ),
          ),
          const Text(
            'Sign Up',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF212325),
            ),
          ),
          const SizedBox(width: 24), // Pour équilibrer la mise en page
        ],
      ),
    );
  }

  // Construction d'un champ de saisie
  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1FA)),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF212325),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF91919F),
          ),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // Construction d'un bouton
  Widget _buildButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    Widget? icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: borderColor != null
                ? BorderSide(color: borderColor)
                : BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon, const SizedBox(width: 12)],
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Construction de l'icône Google
  Widget _buildGoogleIcon() {
    return SizedBox(
      width: 24,
      height: 24,
      child: Stack(
        children: [
          Image.asset('assets/images/google_icon_1.svg'),
          Image.asset('assets/images/google_icon_2.svg'),
          Image.asset('assets/images/google_icon_3.svg'),
          Image.asset('assets/images/google_icon_4.svg'),
        ],
      ),
    );
  }
}