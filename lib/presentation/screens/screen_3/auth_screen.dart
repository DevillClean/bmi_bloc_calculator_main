import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/screens/screen_1/bmi_calculator_screen.dart';
import 'package:flutter_application_2/presentation/screens/screen_3/widgets/custom_button.dart';
import 'package:flutter_application_2/presentation/screens/screen_3/widgets/custom_text_field.dart';
import 'package:flutter_application_2/services/authentication.dart';
import 'package:flutter_application_2/theme/styles.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.onTab});
  final Function()? onTab;
  @override
  // ignore: library_private_types_in_public_api
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isMounted = false;
  bool isLoading = false;
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    isMounted = true;
    super.initState();
  }
  
  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    // signup user using our authmethod
    String res = await AuthMethod().loginUser(
        email: loginController.text, password: passwordController.text);

    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const BmiCalculatorApp(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void safeSetState(VoidCallback fn) {
    if (isMounted) {
      setState(fn);
    }
  }

  @override
  void dispose() {
    isMounted = false;
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Логин',
                  style: tStyleFont,
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: loginController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Пароль',
                  style: tStyleFont,
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap: loginUser,
                  name: 'Sign in',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
