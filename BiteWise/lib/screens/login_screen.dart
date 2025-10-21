import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart'; // Importa a Home Screen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _message = '';
  bool _isLogin = true;

  Future<void> _submitAuth() async {
    setState(() {
      _message = 'Aguarde...';
    });

    final name = 'Maikon Gino';
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _message = 'Preencha email e senha.';
      });
      return;
    }

    try {
      if (_isLogin) {
        // TENTA FAZER LOGIN
        await _authService.login(email, password);
        setState(() {
          _message = 'Sucesso! Logado como $email.';
        });
        // Navega para a tela principal (Home)
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }
      } else {
        // TENTA FAZER REGISTRO
        await _authService.register(name, email, password);
        setState(() {
          _message = 'Registro concluído! Faça login agora.';
          _isLogin = true; // Muda para o modo login
        });
      }
    } catch (e) {
      setState(() {
        // Tenta extrair a mensagem de erro do backend
        String errorDetail = e.toString().contains(':') ? e.toString().split(':')[1].trim() : e.toString();
        _message = 'Erro: $errorDetail';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Fazer Login' : 'Faça seu cadastro no BiteWise'),
        backgroundColor: const Color(0xFFD35400), // Laranja-Paprika
        elevation: 0,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // LOGO (Assumindo que você tem um logo BiteWise em assets/logo.png)
                Image.asset('assets/logo.png', height: 100),
                const SizedBox(height: 30),

                // Título principal (LOGIN/REGISTRO)
                Text(
                  _isLogin ? 'ENTRE NA SUA CONTA' : 'CADASTRE-SE',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: _isLogin ? const Color(0xFFC0392B) : const Color(0xFF117A65) // Vermelho-Tomate ou Verde Mar Profundo
                  ),
                ),
                const SizedBox(height: 20),

                // CAMPO EMAIL
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

                // CAMPO SENHA
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 32),

                // BOTÃO PRINCIPAL (LOGIN/REGISTRAR)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitAuth,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isLogin ? const Color(0xFFD35400) : const Color(0xFF117A65), // Laranja-Paprika / Verde Mar Profundo
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      _isLogin ? 'ENTRAR' : 'CADASTRAR',
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // MENSAGEM DE ERRO/SUCESSO
                Text(
                  _message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _message.contains('Sucesso') ? Colors.green.shade600 : Colors.red.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Botão de alternância
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                      _message = '';
                      _emailController.clear();
                      _passwordController.clear();
                    });
                  },
                  child: Text(
                    _isLogin
                        ? 'Ainda não tem conta? Cadastre-se.'
                        : 'Já tem conta? Fazer Login.',
                    style: TextStyle(color: Colors.grey.shade700, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}