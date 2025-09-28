import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/widgets/Backgroundpattern.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: colors.surface,
        body: Stack(
          children: [
            PatternBackground(),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome to MiniChat",
                    style: textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Mini app, max connection.",
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(15),
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: colors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Scaffold(
                            body: Center(child: Placeholder()),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Let's Chat",
                          style: TextStyle(
                            color: Color(0xFF052659),
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.arrow_right_alt, color: colors.surface),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
