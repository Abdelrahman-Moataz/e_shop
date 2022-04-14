import 'package:e_shop/logic/bindings/auth_bindings.dart';
import 'package:e_shop/view/screens/auth/forget_password_screen.dart';
import 'package:e_shop/view/screens/auth/signup_screen.dart';
import 'package:e_shop/view/screens/welcome_screen.dart';
import 'package:get/get.dart';
import '../view/screens/auth/login_screen.dart';

class  AppRoutes{

  static const welcome = Routes.welcomeScreen;


  static final routes = [

    GetPage(
      name: Routes.welcomeScreen,
      page: ()=> const WelcomeScreen()
    ),

    GetPage(
        name: Routes.loginScreen,
        page: ()=>  LoginScreen(),
        binding:  AuthBindings(),
    ),

    GetPage(
        name: Routes.signUpScreen,
        page: ()=>  SignUpScreen(),
        binding:  AuthBindings(),
    ),

    GetPage(
      name: Routes.forgetPassword,
      page: ()=>   ForgetPasswordScreen(),
      binding:  AuthBindings(),
    ),

  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen   = '/loginScreen';
  static const signUpScreen  = '/signUpScreen';
  static const forgetPassword  = '/forgetPassword';
}
