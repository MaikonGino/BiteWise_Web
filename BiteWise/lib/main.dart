import 'package:bitewise/features/about/about.dart';
import 'package:bitewise/features/auth/login.dart';
import 'package:bitewise/features/auth/signup.dart';
import 'package:bitewise/features/home/home.dart';
import 'package:bitewise/features/profile/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// This widget is the root of your application.
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiteWise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login(),
        '/cadastro': (context) => const Signup(),
        '/sobre-nos': (context) => const About(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
