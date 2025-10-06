import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/sign_up_screen.dart';

class AuthScreenSwitcher extends StatefulWidget {
  const AuthScreenSwitcher({super.key});

  @override
  State<AuthScreenSwitcher> createState() => _AuthScreenSwitcherState();
}

class _AuthScreenSwitcherState extends State<AuthScreenSwitcher> {
  bool showLogin = true;

  void stateSwitcher({required bool login}) {
    setState(() {
      showLogin = login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );
        return FadeTransition(opacity: curved, child: child);
      },
      child: showLogin
          ? LoginScreen(
              key: const ValueKey("Login"),
              onSwitch: () => stateSwitcher(login: false),
            )
          : SignupScreen(
              key: const ValueKey("Sign up"),
              onSwitch: () => stateSwitcher(login: true),
            ),
    );
  }
}
