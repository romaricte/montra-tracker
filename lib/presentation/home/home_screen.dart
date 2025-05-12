import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Couleurs basées sur la maquette Figma
  final Color _backgroundColor = const Color(0xFFFFFFFF); // fill_YTQ2NH
  final Color _primaryGradientStart = const Color(0xFFFFF6E5); // from fill_219MNL
  final Color _primaryGradientEnd = const Color(0x00F8EDD8); // from fill_219MNL (opacity 0)
  final Color _avatarBorderColor1 = const Color(0xFFAD00FF); // from effect_HG5IS6
  final Color _avatarBorderColor2 = const Color(0xFFF5F5F5); // from effect_HG5IS6
  final Color _monthPillBorderColor = const Color(0xFFF1F1FA); // stroke_I7V2HH
  final Color _monthTextColor = const Color(0xFF212325); // fill_CZONQW
  final Color _accountBalanceLabelColor = const Color(0xFF91919F); // fill_WGT0ND
  final Color _accountBalanceAmountColor = const Color(0xFF161719); // fill_NYA4G5
  final Color _incomeCardColor = const Color(0xFF00A86B); // fill_49RJDI
  final Color _expenseCardColor = const Color(0xFFFD3C4A); // fill_OZ02DS
  final Color _cardTextColor = const Color(0xFFFCFCFC); // fill_RPZSBD (used for text on colored cards)
  final Color _iconBackgroundColor = const Color(0xFFFCFCFC); // fill_RPZSBD (used for icon background on colored cards)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopSection(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildSpendFrequencyTabs(),
                      const SizedBox(height: 20),
                      _buildGraphPlaceholder(),
                      const SizedBox(height: 20),
                      _buildRecentTransactionsHeader(),
                      const SizedBox(height: 10),
                      _buildTransactionItem(
                        iconPath: 'assets/images/shopping_bag.svg',
                        category: 'Shopping',
                        description: 'Buy some grocery',
                        amount: '- \$120',
                        time: '10:00 AM',
                        iconBackgroundColor: const Color(0xFFFCEED4), // fill_69B2RQ
                        amountColor: const Color(0xFFFD3C4A) // fill_OZ02DS
                      ),
                      _buildTransactionItem(
                        iconPath: 'assets/images/recurring_bill.svg',
                        category: 'Subscription',
                        description: 'Disney+ Annual..',
                        amount: '- \$80',
                        time: '03:30 PM',
                        iconBackgroundColor: const Color(0xFFEEE5FF), // fill_0HM25I
                        amountColor: const Color(0xFFFD3C4A) // fill_OZ02DS
                      ),
                      _buildTransactionItem(
                        iconPath: 'assets/images/restaurant.svg',
                        category: 'Food',
                        description: 'Buy a ramen',
                        amount: '- \$32',
                        time: '07:30 PM',
                        iconBackgroundColor: const Color(0xFFFDD5D7), // fill_UPONHC
                        amountColor: const Color(0xFFFD3C4A) // fill_OZ02DS
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF7F3DFF), // fill_Z32C3M
        child: SvgPicture.asset(
          'assets/images/nav_add.svg',
          width: 24,
          height: 24,
          allowDrawingOutsideViewBox: true,
        ),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Construit la section supérieure de l'écran (app bar, solde, revenus/dépenses)
  Widget _buildTopSection() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [_primaryGradientStart, _primaryGradientEnd],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          _buildAppBar(),
          const SizedBox(height: 20),
          Text(
            'Account Balance',
            style: TextStyle(
              color: _accountBalanceLabelColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '\$9400',
            style: TextStyle(
              color: _accountBalanceAmountColor,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          _buildIncomeExpenseCards(),
        ],
      ),
    );
  }

  // Construit la barre d'application personnalisée
  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: _avatarBorderColor1, width: 3),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _avatarBorderColor2, width: 2),
              ),
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/avatar.png'), // Assurez-vous que ce chemin est correct
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: _monthPillBorderColor),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/arrow_down_2.svg', 
                  width: 18, 
                  height: 18, 
                  allowDrawingOutsideViewBox: true,
                ),
                const SizedBox(width: 4),
                Text(
                  'October',
                  style: TextStyle(color: _monthTextColor, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          IconButton(
            icon: SvgPicture.asset('assets/images/notification.svg', width: 24, height: 24, allowDrawingOutsideViewBox: true, colorFilter: ColorFilter.mode(const Color(0xFF7F3DFF), BlendMode.srcIn)),
            onPressed: () {
              // Action pour les notifications
            },
          ),
        ],
      ),
    );
  }

  // Construit les cartes de revenus et de dépenses
  Widget _buildIncomeExpenseCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: _buildInfoCard(
              iconPath: 'assets/images/income.svg',
              label: 'Income',
              amount: '\$5000',
              cardColor: _incomeCardColor,
              iconColor: _incomeCardColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildInfoCard(
              iconPath: 'assets/images/expense.svg',
              label: 'Expenses',
              amount: '\$1200',
              cardColor: _expenseCardColor,
              iconColor: _expenseCardColor,
            ),
          ),
        ],
      ),
    );
  }

  // Construit une carte d'information générique (pour revenus/dépenses)
  Widget _buildInfoCard({
    required String iconPath,
    required String label,
    required String amount,
    required Color cardColor,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _iconBackgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(iconPath, width: 24, height: 24, allowDrawingOutsideViewBox: true, colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn)),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: _cardTextColor, fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Text(
                amount,
                style: TextStyle(color: _cardTextColor, fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Construit les onglets de fréquence des dépenses
  Widget _buildSpendFrequencyTabs() {
    return Container(
      padding: const EdgeInsets.all(2), // Pour la bordure
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC), // stroke_ZQ4N8E (background of tabs container)
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1FA)) // Approximated from Figma
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem('Today', isSelected: true),
          _buildTabItem('Week'),
          _buildTabItem('Month'),
          _buildTabItem('Year'),
        ],
      ),
    );
  }

  // Construit un élément d'onglet individuel
  Widget _buildTabItem(String label, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12), // Adjusted padding
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFCEED4) : Colors.transparent, // fill_69B2RQ for selected
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? const Color(0xFFFCAC12) : const Color(0xFF91919F), // fill_9PCWNZ for selected, fill_WGT0ND for others
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Construit un placeholder pour le graphique
  Widget _buildGraphPlaceholder() {
    // Placeholder pour le graphique, basé sur l'élément 'Graph' (I826:295)
    // Le graphique réel nécessiterait une bibliothèque de graphiques ou une implémentation personnalisée.
    return Container(
      height: 150, // Hauteur approximative
      alignment: Alignment.center,
      child: SvgPicture.asset(
        'assets/images/graph_placeholder.svg',
        allowDrawingOutsideViewBox: true, // Vous devrez créer ce SVG ou utiliser une image
        fit: BoxFit.contain,
        // Si vous n'avez pas de SVG de graphique, utilisez un Text ou un Container coloré
        // child: Text('Graph Placeholder', style: TextStyle(color: Colors.grey)),
        // Pour l'instant, je vais utiliser un Text car je n'ai pas le SVG du graphique.
        // Pour utiliser un SVG, assurez-vous que le fichier existe dans assets/images/
        // et décommentez la ligne SvgPicture.asset ci-dessus.
        // Pour l'instant, nous allons simuler avec un conteneur.
        // Pour le dégradé et la ligne, cela nécessiterait CustomPainter ou un package.
      ),
      // Remplacé par un simple texte pour l'instant
      // child: Text('Graph Area', style: TextStyle(fontSize: 18, color: Colors.grey)),
    );
  }

  // Construit l'en-tête de la section des transactions récentes
  Widget _buildRecentTransactionsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Recent Transaction',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF292B2D)), // style_4F63DI, fill_5PDC10
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFFEEE5FF), // fill_0HM25I
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
          child: const Text(
            'See All',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF7F3DFF)), // style_3EFZ6X, fill_Z32C3M
          ),
        ),
      ],
    );
  }

  // Construit un élément de la liste des transactions
  Widget _buildTransactionItem({
    required String iconPath,
    required String category,
    required String description,
    required String amount,
    required String time,
    required Color iconBackgroundColor,
    required Color amountColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC), // fill_RPZSBD
        borderRadius: BorderRadius.circular(24),
        // Pas d'ombre portée visible dans la maquette pour les items de transaction individuels
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(iconPath, width: 24, height: 24, allowDrawingOutsideViewBox: true, colorFilter: ColorFilter.mode(amountColor == const Color(0xFFFD3C4A) ? const Color(0xFFFCAC12) : const Color(0xFF7F3DFF) , BlendMode.srcIn)), // Couleur de l'icône ajustée
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF292B2D)), // style_YG78VK, fill_5PDC10
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF91919F)), // style_XBBU00, fill_WGT0ND
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: amountColor), // style_DUBXEH
              ),
              Text(
                time,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF91919F)), // style_XBBU00, fill_WGT0ND
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Construit la barre de navigation inférieure
  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      color: const Color(0xFFFCFCFC), // fill_RPZSBD
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildBottomNavItem(iconPath: 'assets/images/nav_home.svg', label: 'Home', isSelected: true),
            _buildBottomNavItem(iconPath: 'assets/images/nav_transaction.svg', label: 'Transaction'),
            const SizedBox(width: 40), // Espace pour le FAB
            _buildBottomNavItem(iconPath: 'assets/images/nav_budget.svg', label: 'Budget'),
            _buildBottomNavItem(iconPath: 'assets/images/nav_profile.svg', label: 'Profile'),
          ],
        ),
      ),
    );
  }

  // Construit un élément de la barre de navigation inférieure
  Widget _buildBottomNavItem({required String iconPath, required String label, bool isSelected = false}) {
    final Color itemColor = isSelected ? const Color(0xFF7F3DFF) : const Color(0xFFC6C6C6); // fill_Z32C3M or fill_QZ6KGX
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Gérer la navigation
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(iconPath, width: 24, height: 24, allowDrawingOutsideViewBox: true, colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn)),
              Text(label, style: TextStyle(color: itemColor, fontSize: 10, fontWeight: FontWeight.w500)), // style_VZK0FK
            ],
          ),
        ),
      ),
    );
  }
}