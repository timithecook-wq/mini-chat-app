import 'dart:math';
import 'package:flutter/material.dart';

class PatternBackground extends StatefulWidget {
  const PatternBackground({super.key});

  @override
  _PatternBackgroundState createState() => _PatternBackgroundState();
}

class _PatternBackgroundState extends State<PatternBackground> {
  final Random random = Random();
  final List<_IconInfo> iconsData = [];
  bool initialized = false;
  final List<IconData?> iconOptions = [
    null,
    Icons.chat_bubble_outline,
    Icons.person_outline,
    Icons.star_outline,
    Icons.upload_outlined,
    Icons.lightbulb_outline,
    Icons.book,
    Icons.bookmark_outline,
    Icons.school,
    Icons.send,
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!initialized) {
      final screenSize = MediaQuery.of(context).size;
      final double density = 0.035;
      final int iconCount = (screenSize.width * screenSize.height * density)
          .toInt();

      const double padding = 2;

      for (int i = 0; i < iconCount; i++) {
        bool placed = false;
        int tries = 0;

        while (!placed && tries < 100) {
          final size = 16.0 + random.nextInt(20);

          final top = random.nextDouble() * (screenSize.height - size);

          final left = random.nextDouble() * (screenSize.width - size);

          bool overlaps = iconsData.any((icon) {
            final dx = (icon.left - left).abs();
            final dy = (icon.top - top).abs();
            final minDist = (icon.size / 2 + size / 2 + padding);
            return dx < minDist && dy < minDist;
          });

          if (!overlaps) {
            iconsData.add(
              _IconInfo(
                icon: iconOptions[random.nextInt(iconOptions.length)],

                size: size,
                top: top,
                left: left,
                angle: (random.nextDouble() * pi / 2) - (pi / 4),
              ),
            );
            placed = true;
          }

          tries++;
        }
      }

      initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Stack(
      children: iconsData.map((data) {
        return Positioned(
          top: data.top,
          left: data.left,
          child: Transform.rotate(
            angle: data.angle,
            child: data.icon == null
                ? Container(
                    width: data.size,
                    height: data.size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: colors.onSurface, width: 1.5),
                    ),
                  )
                : Icon(data.icon, size: data.size, color: colors.onSurface),
          ),
        );
      }).toList(),
    );
  }
}

class _IconInfo {
  final IconData? icon;
  final double size;
  final double top;
  final double left;
  final double angle;

  _IconInfo({
    required this.icon,
    required this.size,
    required this.top,
    required this.left,
    required this.angle,
  });
}
