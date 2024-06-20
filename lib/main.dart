import 'package:flutter/material.dart';
import 'package:flutter_application_2/router/go_router.dart';

void main() {
  AppRouter.init(); 
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp.router(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
       routerDelegate: AppRouter.router.routerDelegate,
       routeInformationParser: AppRouter.router.routeInformationParser,
       routeInformationProvider: AppRouter.router.routeInformationProvider,
      );
  }
}
