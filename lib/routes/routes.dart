import 'package:asrooshop/logic/bindings/auth_binding.dart';
import 'package:asrooshop/logic/bindings/main_biniding.dart';
import 'package:asrooshop/logic/bindings/product_biniding.dart';
import 'package:asrooshop/view/screens/auth/forget_password.dart';
import 'package:asrooshop/view/screens/auth/login_screen.dart';
import 'package:asrooshop/view/screens/auth/signup_screen.dart';
import 'package:asrooshop/view/screens/main_screen.dart';
import 'package:asrooshop/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  //initialRoute
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  //getPages
//the meaning of static word is that we can touch it(the static word) from any place
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.mainScreen, page: () => MainScreen(), bindings: [
      AuthBinding(),
      MainBinding(),
      ProductBinding(),
    ]),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
}
