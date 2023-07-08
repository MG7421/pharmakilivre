
import 'package:flutter/widgets.dart';
import 'package:pharmakilivre/Screens/pages/widget/pharmacie.dart';
import 'package:pharmakilivre/Screens/profile/profile_screen.dart';

import '../Screens/auth/login_screen.dart';
import '../Screens/auth/password_screen.dart';
import '../Screens/auth/register_screen.dart';
import '../Screens/pages/dashboard.dart';
import '../Screens/splash/splash_screen.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  PasswordScreen.routeName: (context) => PasswordScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  DashboardScreen.routeName: (context) => DashboardScreen(),
  ProfileScreen.routeName:(context)=> ProfileScreen(),
  PharmacyPage.routeName:(context)=> PharmacyPage()
};
