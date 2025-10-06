import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/animated_button.dart';
import 'package:flutter_app/widgets/input_field.dart';
import 'package:flutter_app/widgets/pillbar.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onSwitch;
  const LoginScreen({super.key, required this.onSwitch});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _allFieldfilled = false;
  void checkfields() {
    setState(() {
      _allFieldfilled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          color: colors.surface,
          child: Padding(
            padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 47,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                        color: colors.secondary,
                      ),
                    ),
                    Divider(thickness: 1, height: 25, color: Colors.black),

                    //Username field
                    InputField(icon: Icons.person, text: "Enter Username"),
                    const SizedBox(height: 8),

                    //Password Field
                    InputField(
                      icon: Icons.password,
                      text: "Enter password",
                      obscure: true,
                    ),
                    const SizedBox(height: 8),

                    //reset password
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Placeholder()),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: colors.secondary,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Roboto",
                              decoration: TextDecoration.underline,
                              decorationColor: colors.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    //login button
                    AnimatedButton(
                      icon: Icons.login,
                      label: "Login",
                      enabled: _allFieldfilled,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Placeholder()),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //sign up
                          Text(
                            "New User?",
                            style: TextStyle(
                              color: Colors.white54,
                              fontFamily: "Roboto",
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              print("sign up pressed");
                              widget.onSwitch();
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: colors.secondary,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Roboto",
                                decoration: TextDecoration.underline,
                                decorationColor: colors.secondary,
                                decorationThickness: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 24, color: Colors.black, thickness: 1),
                  ],
                ),
                Spacer(),

                Pillbar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
