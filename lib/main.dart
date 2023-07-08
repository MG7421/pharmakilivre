import 'package:flutter/material.dart';
import 'package:pharmakilivre/constants.dart';
import 'package:pharmakilivre/routes/global_route.dart';
import 'package:pharmakilivre/routes/routes.dart';
import 'package:provider/provider.dart';

import 'Screens/splash/splash_screen.dart';
import 'bloc/LoginBloc.dart';
import 'services/ApiLogin_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RouteUtil.initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String lastRoute = RouteUtil.getLastRoute();

    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (_) => LoginBloc(apiService: ApiService())),
        // Other providers...
      ],

      child: MaterialApp(
        title: 'The Flutter Way',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide.none,
              ),
              elevation: 0,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: const Color(0xFFFBFBFB),
            filled: true,
            border: defaultOutlineInputBorder,
            enabledBorder: defaultOutlineInputBorder,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),
        initialRoute: lastRoute,
        routes: routes,
      ),
    );
  }
}




