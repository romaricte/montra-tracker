import 'package:flutter/material.dart';

// Classe représentant l'écran d'ajout d'un nouveau compte.
class AddNewAccountScreen extends StatefulWidget {
  const AddNewAccountScreen({super.key});

  @override
  State<AddNewAccountScreen> createState() => _AddNewAccountScreenState();
}

class _AddNewAccountScreenState extends State<AddNewAccountScreen> {
  // Contrôleur pour le champ de saisie du solde.
  final TextEditingController _balanceController = TextEditingController(text: "0.00");
  // Contrôleur pour le champ de saisie du nom du compte.
  final TextEditingController _nameController = TextEditingController();
  // Type de compte sélectionné.
  String? _selectedAccountType;
  // Liste des types de comptes disponibles.
  final List<String> _accountTypes = ['Bank', 'Wallet', 'Card', 'Paypal', 'Other'];

  // Couleurs principales basées sur la maquette Figma.
  final Color _primaryColor = const Color(0xFF7F3DFF);
  final Color _lightTextColor = const Color(0xFFFCFCFC);
  final Color _inputBorderColor = const Color(0xFFF1F1FA);
  final Color _placeholderTextColor = const Color(0xFF91919F);

  @override
  void dispose() {
    _balanceController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  // Construit l'interface utilisateur de l'écran.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _primaryColor,
      appBar: AppBar(
        backgroundColor: _primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: _lightTextColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Add new account',
          style: TextStyle(
            color: _lightTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section pour la saisie du solde.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Balance',
                style: TextStyle(
                  color: _lightTextColor.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: _balanceController,
                style: TextStyle(
                  color: _lightTextColor,
                  fontSize: 50, // Ajusté pour une meilleure lisibilité
                  fontWeight: FontWeight.w600,
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: "0.00",
                  hintStyle: TextStyle(
                    color: _lightTextColor.withOpacity(0.5),
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                  border: InputBorder.none,
                  prefixText: "\$",
                  prefixStyle: TextStyle(
                    color: _lightTextColor,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Section du formulaire principal.
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Champ de saisie pour le nom du compte.
                    _buildTextField(
                      controller: _nameController,
                      labelText: 'Name',
                    ),
                    const SizedBox(height: 16),
                    // Champ de sélection pour le type de compte.
                    _buildDropdownField(
                      labelText: 'Account Type',
                      value: _selectedAccountType,
                      items: _accountTypes,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedAccountType = newValue;
                        });
                      },
                    ),
                    const Spacer(),
                    // Bouton pour continuer.
                    ElevatedButton(
                      onPressed: () {
                        // Logique pour ajouter le compte
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: _lightTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16), // Espace pour le home indicator si nécessaire
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper pour construire un champ de texte stylisé.
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: _placeholderTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: _inputBorderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: _inputBorderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: _primaryColor, width: 1.5),
        ),
      ),
    );
  }

  // Widget helper pour construire un champ de sélection (dropdown) stylisé.
  Widget _buildDropdownField({
    required String labelText,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: _placeholderTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: _inputBorderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: _inputBorderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: _primaryColor, width: 1.5),
        ),
      ),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      hint: Text('Select Account Type', style: TextStyle(color: _placeholderTextColor)),
      icon: Icon(Icons.keyboard_arrow_down, color: _placeholderTextColor),
    );
  }
}