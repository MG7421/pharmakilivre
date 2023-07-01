import 'package:flutter/material.dart';
import 'package:pharmakilivre/bloc/LoginBloc.dart';
import 'package:pharmakilivre/screens/onboarding/onboarding_example.dart';
import 'package:pharmakilivre/services/ApiLogin_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (_) => LoginBloc(apiService: ApiService())),
        // Other providers...
      ],
      child: MaterialApp(
        title: 'Pharmakilivre',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        home: OnboardingExample(),
      )
    );


  }
}