import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class BackgroundPattern extends StatefulWidget {
  const BackgroundPattern({super.key});

  @override
  State<BackgroundPattern> createState() => _BackgroundPatternState();
}

class _BackgroundPatternState extends State<BackgroundPattern> {
  final random = Random();
  final List<_IconInfo> iconsData = [];
  File? _backgroundImage;

  // Replace these with your icon options
  final List<IconData> iconOptions = [
    Icons.chat_bubble_outline,
    Icons.person_outline,
    Icons.book,
    Icons.send,
    Icons.upload_outlined,
    Icons.star_outline,
    Icons.lightbulb_outline,
    Icons.bookmark_outline,
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final screenSize = MediaQuery.of(context).size;
      final directory = await getApplicationDocumentsDirectory();
      final patternFile = File('${directory.path}/background_pattern.png');

      if (await patternFile.exists()) {
        // Load saved pattern
        print("loading saved pattern");
        setState(() {
          _backgroundImage = patternFile;
        });
        final imageProvider = FileImage(patternFile);
        await precacheImage(imageProvider, context);
      } else {
        // Generate new pattern and save it
        await generatePattern(screenSize);
      }
    });
  }

  Future<void> generatePattern(Size screenSize) async {
    const double density = 0.035;
    final int iconCount = (screenSize.width * screenSize.height * density)
        .toInt();
    const double padding = 2;

    // Draw to canvas
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // Optional background fill
    final paint = Paint()..color = Colors.transparent;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, screenSize.width, screenSize.height),
      paint,
    );

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
          final icon = iconOptions[random.nextInt(iconOptions.length)];
          final painter = TextPainter(
            text: TextSpan(
              text: String.fromCharCode(icon.codePoint),
              style: TextStyle(
                fontFamily: icon.fontFamily,
                fontSize: size,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            textDirection: TextDirection.ltr,
          );

          canvas.save();
          canvas.translate(left + size / 2, top + size / 2);
          canvas.rotate((random.nextDouble() * pi / 2) - (pi / 4));
          canvas.translate(-size / 2, -size / 2);
          painter.layout();
          painter.paint(canvas, Offset.zero);
          canvas.restore();

          iconsData.add(
            _IconInfo(
              icon: icon,
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

    // Convert to image
    final picture = recorder.endRecording();
    final image = await picture.toImage(
      screenSize.width.toInt(),
      screenSize.height.toInt(),
    );
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    // Save to local storage
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/background_pattern.png');
    await file.writeAsBytes(byteData!.buffer.asUint8List());

    final imageProvider = FileImage(file);
    await precacheImage(imageProvider, context);

    setState(() {
      _backgroundImage = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _backgroundImage != null
        ? Image.file(
            _backgroundImage!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          )
        : const Center(child: CircularProgressIndicator());
  }
}

class _IconInfo {
  final IconData icon;
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
