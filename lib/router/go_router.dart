import 'package:flutter_application_2/data/firebase/farebase_stream.dart';
import 'package:flutter_application_2/presentation/screens/screen_1/bmi_calculator_screen.dart';
import 'package:flutter_application_2/presentation/screens/screen_2/settings_screen.dart';
import 'package:flutter_application_2/services/check_login_or_signup.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._privateConstructor();
  static late GoRouter router;

  AppRouter._privateConstructor() {
    _initialize();
  }

  factory AppRouter.init() {
    return _instance;
  }

  void _initialize() {
    router = GoRouter(initialLocation: '/', routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const FarebaseStreem(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginOrSignUpScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const BmiCalculatorApp(),
      ),
      GoRoute(
        path: '/Settings',
        builder: (context, state) => const Settings(),
      ),
    ]);
  }
}
