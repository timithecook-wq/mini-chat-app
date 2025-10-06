import 'package:flutter/material.dart';

Future<void> showdropdialog({
  required BuildContext context,
  required Widget child,
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54,
    transitionDuration: Duration(milliseconds: 350),
    barrierLabel: "Login",
    pageBuilder: (_, __, ___) {
      return child;
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final slide = Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(position: slide, child: child),
      );
    },
  );
}
