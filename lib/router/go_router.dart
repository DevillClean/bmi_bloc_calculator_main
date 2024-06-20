import 'package:flutter_application_2/pages/settings.dart';
import 'package:flutter_application_2/views/bmi_calculator_app.dart';
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

  void _initialize(){
    router = GoRouter(
      initialLocation: '/',
      routes: [
         GoRoute(
            path: '/',
            builder: (context, state) => const BmiCalculatorApp(),
          ),
          GoRoute(
            path: '/Settings',
            builder: (context, state) => const Settings(),
          ),
      ]
    );
  }
}
