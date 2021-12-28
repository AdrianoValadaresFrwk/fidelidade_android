import 'package:fidelidade_android/constants.dart';
import 'package:fidelidade_android/pages/MainPage.dart';
import 'package:fidelidade_android/pages/Notifications/NotificationsPage.dart';
import 'package:fidelidade_android/pages/SignUp/SignUpPage.dart';
import 'package:fidelidade_android/pages/SignUp/SignUpSecondPage.dart';
import 'package:fidelidade_android/pages/Welcome/WelcomeScreen.dart';
import 'package:fidelidade_android/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "+Fideliade",
      initialRoute: '/',
      theme: MyTheme.defaultTheme,
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => const MainPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/signup': (context) => const SignUpPage(),
        '/signup/2': (context) => const SignUpSecondPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}