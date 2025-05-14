import 'package:bitewise/features/about/presentation/screens/about_screen.dart';
import 'package:bitewise/features/auth/presentation/screens/login.dart';
import 'package:bitewise/features/auth/presentation/screens/signup.dart';
import 'package:bitewise/features/home/presentation/screens/home_screen.dart';
import 'package:bitewise/features/profile/presentation/screens/profile.dart';
import 'package:bitewise/shared/shell/app_shell.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiteWise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        Widget pageContent;

        // Mapeia o nome da rota para o conteúdo da página
        // As chaves aqui devem corresponder às 'screenKeyOrRoutePath'
        // que o HeaderWidget.onNavigate vai usar.
        switch (settings.name) {
          case '/':
          case '/planos': // Se 'planos' no header deve levar para Home
            pageContent = const Home();
            break;
          case '/sobre-nos':
            pageContent = const About();
            break;
          case '/login':
            pageContent = const Login();
            break;
          case '/profile':
            pageContent = const ProfilePage();
            break;
          case '/register':
            pageContent = const Signup();
            break;
          default:
            // Rota desconhecida, pode redirecionar para Home ou uma página 404
            pageContent =
                const Home(); // Ou Scaffold(body: Center(child: Text('Página não encontrada')))
        }

        return MaterialPageRoute(
          settings:
              settings, // Importante para passar o nome da rota e argumentos
          builder: (context) => AppShell(child: pageContent),
        );
      },
    );
  }
}
