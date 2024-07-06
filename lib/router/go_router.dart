// import 'package:flutter_application_2/data/service/session_service.dart';
import 'package:flutter_application_2/data/service/session_service.dart';
import 'package:flutter_application_2/presentation/screens/screen_1/bloc/bmi_bloc.dart';
import 'package:flutter_application_2/presentation/screens/screen_1/bmi_calculator_screen.dart';
import 'package:flutter_application_2/presentation/screens/screen_2/settings_screen.dart';
import 'package:flutter_application_2/services/check_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._privateConstructor();
  static late GoRouter router;
  // final SessionService sessionService = SessionService.init();

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
        redirect: (context, state) {
          if (SessionService.instance.currentUser != null) {
            return '/home';
          } else {
            return '/login';
          }
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginOrSignUpScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => BlocProvider(
          create: (context) => BmiBloc(),
          child: const BmiCalculatorApp(),
        ),
      ),
      GoRoute(
        path: '/Settings',
        builder: (context, state) => const Settings(),
      ),
    ]);
  }
}
