import 'package:get/get.dart';
import 'package:montra_tracker/presentation/auth/signup_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String product = '/product';


  static List<GetPage> pages = [
    GetPage(
      name: register,
      page: () => const SignupScreen(),
    ),
   
  ];
}
