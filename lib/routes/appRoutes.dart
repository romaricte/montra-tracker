import 'package:get/get.dart';
import 'package:montra_tracker/presentation/auth/signup_screen.dart';
import 'package:montra_tracker/presentation/onboarding/add_new_account_screen.dart';
import 'package:montra_tracker/presentation/onboarding/setup_account_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String setupAccount = '/setupAccount';
  static const String addNewAccount = '/addNewAccount';
  static const String product = '/product';


  static List<GetPage> pages = [
    GetPage(
      name: register,
      page: () => const SignupScreen(),
    ),
   GetPage(
      name: setupAccount,
      page: () => const SetupAccountScreen(),
      transition: Transition.zoom,
    ),
   GetPage(
      name: addNewAccount,
      page: () => const AddNewAccountScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    
   
  ];
}
