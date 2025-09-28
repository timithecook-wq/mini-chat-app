import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Welcome_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Chat App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF052659))
            .copyWith(
              surface: Color(0xFF052659),
              onSurface: Color(0xFF3DDCF7).withOpacity(0.3),
              secondary: Color(0xFFC1E8FF),
            ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Color(0xFF052659)),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
