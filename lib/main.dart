import 'package:chatt_app/pages/about_page.dart';
import 'package:chatt_app/pages/chatt_page.dart';
import 'package:chatt_app/pages/chatt_room.dart';
import 'package:chatt_app/services/auth/auth_gate.dart';
import 'package:chatt_app/firebase_options.dart';
import 'package:chatt_app/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: lightMode,
      initialRoute: '/',
      routes: {
        '/home': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/gallery' : (context) => AboutPage(),
      },
    );
  }
}
