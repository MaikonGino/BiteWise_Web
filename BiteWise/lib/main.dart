import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Importa a Home

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
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      // Inicia direto na HomeScreen, como solicitado
      home: const HomeScreen(),
    );
  }
}