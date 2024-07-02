import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/screens/screen_3/auth_screen.dart';
import 'package:go_router/go_router.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({
    super.key,
  });

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  final user = FirebaseAuth.instance.currentUser!;
  void signOut() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
            builder: (context) => AuthScreen(
                  onTab: () {},
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.go('/Settings');
          },
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
        const Text('BMI CALCULATOR'),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${user.email}'),
              IconButton(
                onPressed: signOut,
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
