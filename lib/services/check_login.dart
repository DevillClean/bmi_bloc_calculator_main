import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/screens/screen_3/auth_screen.dart';

class LoginOrSignUpScreen extends StatefulWidget {
  const LoginOrSignUpScreen({super.key});

  @override
  State<LoginOrSignUpScreen> createState() => _LoginOrSignUpScreenState();
}

class _LoginOrSignUpScreenState extends State<LoginOrSignUpScreen> {
  bool showLoginScreen = true;
  void toggelScreen() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return AuthScreen(onTab: toggelScreen);
    } else {
      return AuthScreen(onTab: toggelScreen);
    }
  }
}