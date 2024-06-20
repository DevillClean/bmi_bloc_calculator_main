import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/constans.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgk,
        title: const Text(
          'List of other technologies',
          style: bodyTextStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    foregroundColor: WidgetStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    context.go('/');
                  },
                  icon: const Icon(FontAwesomeIcons.arrowLeft),
                  label: const Text('Back'),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
