import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/screens/screen_1/bmi_calculator_screen.dart';
import 'package:flutter_application_2/services/check_login_or_signup.dart';

class FarebaseStreem extends StatelessWidget {
  const FarebaseStreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BmiCalculatorApp();
          } else {
            return const LoginOrSignUpScreen();
          }
        },
      ),
    );
  }
}
