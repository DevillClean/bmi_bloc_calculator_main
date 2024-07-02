import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/firebase/firebase_options.dart';
import 'package:flutter_application_2/presentation/screens/screen_1/bloc/bmi_bloc.dart';
import 'package:flutter_application_2/router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
  AppRouter.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return BlocProvider(
      create: (context) => BmiBloc(),
      child: BlocBuilder<BmiBloc, BmiState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            routerDelegate: AppRouter.router.routerDelegate,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
