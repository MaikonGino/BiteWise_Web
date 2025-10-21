import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'services/auth_service.dart';

void main() {
  runApp(const BiteWiseApp());
}

class BiteWiseApp extends StatelessWidget {
  const BiteWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiteWise App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: FutureBuilder<bool>(
        future: AuthService().isAuthenticated(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (snapshot.hasData && snapshot.data == true) {
            return const HomeScreen(); // Se autenticado, vai para Home
          }
          return const LoginScreen(); // Senão, vai para Login
        },
      ),
    );
  }
}