import 'package:flutter/material.dart';

class Pillbar extends StatelessWidget {
  const Pillbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12, top: 12),
        child: Container(
          width: 45,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white54,
          ),
        ),
      ),
    );
  }
}
