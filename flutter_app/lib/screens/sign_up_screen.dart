import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/animated_button.dart';
import 'package:flutter_app/widgets/input_field.dart';
import '../widgets/pillbar.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback onSwitch;
  const SignupScreen({super.key, required this.onSwitch});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _allFieldfilled = true;
  void checkfields() {
    setState(() {
      _allFieldfilled = true;
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
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 47,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                        color: colors.secondary,
                      ),
                    ),
                    Divider(thickness: 1, height: 25, color: Colors.black),

                    //Name field
                    InputField(icon: Icons.badge, text: "Enter Full name"),
                    const SizedBox(height: 8),

                    //Username field
                    InputField(
                      icon: Icons.person,
                      text: "enter username",
                      secondicon: true,
                    ),
                    const SizedBox(height: 8),

                    //Email field
                    InputField(icon: Icons.email, text: "Enter email"),
                    const SizedBox(height: 8),

                    //Password Field
                    InputField(
                      icon: Icons.password,
                      text: "Enter Password",
                      showsuffix: true,
                      obscure: true,
                    ),
                    const SizedBox(height: 8),

                    //Confirm Password Field
                    InputField(
                      icon: Icons.password,
                      text: "Confirm Password",
                      showsuffix: true,
                      seconpicon: true,
                      obscure: true,
                    ),
                    const SizedBox(height: 20),

                    //Sign up Button
                    AnimatedButton(
                      icon: Icons.app_registration,
                      label: "Sign up",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Placeholder()),
                        );
                      },
                      enabled: _allFieldfilled,
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Login
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.white54,
                              fontFamily: "Roboto",
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextButton(
                            onPressed: widget.onSwitch,
                            child: Text(
                              "Login",
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
