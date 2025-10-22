import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  String _message = '';
  bool _isLogin = true;
  bool _isLoading = false;

  // Paleta de Cores do BiteWise (Documentação PI)
  static const Color colorLaranjaPaprika = Color(0xFFD35400);
  static const Color colorLaranjaMel = Color(0xFFF39C12);
  static const Color colorVerdeMarProfundo = Color(0xFF117A65);
  static const Color colorVermelhoTomate = Color(0xFFC0392B);

  // Estilo de input comum
  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey.shade700),
      prefixIcon: Icon(icon, color: colorLaranjaMel),
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: colorLaranjaPaprika, width: 2),
      ),
    );
  }

  Future<void> _submitAuth() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _message = 'Aguarde...';
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      if (_isLogin) {
        // --- TENTATIVA DE LOGIN ---
        await _authService.login(email, password);
        setState(() {
          _message = 'Sucesso! Login realizado.';
        });
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }
      } else {
        // --- TENTATIVA DE REGISTRO ---
        final name = _nameController.text;
        if (name.isEmpty) {
          throw Exception("O campo Nome é obrigatório.");
        }
        if (password != _passwordConfirmController.text) {
          throw Exception("As senhas não coincidem.");
        }
        await _authService.register(name, email, password);
        setState(() {
          _message = 'Registro concluído! Faça login agora.';
          _isLogin = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        String errorDetail = e.toString().contains(':') ? e.toString().split(':')[1].trim() : e.toString();
        _message = 'Erro: $errorDetail';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fundo bege suave para a página
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF0), // Um bege/creme suave
      appBar: AppBar(
        title: Text(_isLogin ? 'Login BiteWise' : 'Faça seu cadastro no BiteWise'),
        backgroundColor: colorLaranjaPaprika,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24.0),
            // Card com sombra suave
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // LOGOTIPO (Assumindo que está em assets/images/logo.png)
                Image.asset('assets/images/logo.png', height: 100),
                const SizedBox(height: 24),

                // Campos que aparecem apenas no Registro
                if (!_isLogin) ...[
                  _buildTextField(_nameController, 'Nome Completo', Icons.person_outline),
                  const SizedBox(height: 16),
                ],

                // Campos comuns
                _buildTextField(_emailController, 'E-mail', Icons.email_outlined),
                const SizedBox(height: 16),
                _buildTextField(_passwordController, 'Senha', Icons.lock_outline, obscure: true),
                const SizedBox(height: 16),

                // Campo de confirmação de senha (Registro)
                if (!_isLogin) ...[
                  _buildTextField(_passwordConfirmController, 'Repetir senha', Icons.lock_outline, obscure: true),
                  const SizedBox(height: 24),
                ],

                if (_isLogin) const SizedBox(height: 8),

                // Mensagem de Status/Erro
                if (_message.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      _message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _message.contains('Sucesso') ? colorVerdeMarProfundo : colorVermelhoTomate,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                // Botão Principal (Login/Registrar)
                _isLoading
                    ? const Center(child: CircularProgressIndicator(color: colorLaranjaPaprika))
                    : ElevatedButton(
                  onPressed: _submitAuth,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorLaranjaPaprika,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                  ),
                  child: Text(
                    _isLogin ? 'ENTRAR' : 'CADASTRAR',
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),

                // Divisor "OU" (Conforme Figma)
                const Row(
                  children: [
                    Expanded(child: Divider(thickness: 0.5)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('OU', style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider(thickness: 0.5)),
                  ],
                ),
                const SizedBox(height: 20),

                // Botão Google (Conforme Figma)
                _buildGoogleButton(),
                const SizedBox(height: 20),

                // Botão de alternância
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                      _message = '';
                    });
                  },
                  child: Text(
                    _isLogin
                        ? 'Não tem conta? Cadastre-se'
                        : 'Já tem conta? Fazer Login',
                    style: const TextStyle(color: colorVerdeMarProfundo, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget de Input Padrão
  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: colorLaranjaMel),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: colorLaranjaPaprika, width: 2),
        ),
      ),
    );
  }

  // Widget Botão Google
  Widget _buildGoogleButton() {
    return OutlinedButton.icon(
      onPressed: () {
        setState(() {
          _message = 'Login com Google (Implementação Futura)';
        });
      },
      // Certifique-se de ter 'assets/images/google_icon.png' no seu pubspec.yaml
      icon: Image.asset('assets/images/google_icon.png', height: 22, width: 22),
      label: const Text('Entre com o Google', style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w600)),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide(color: Colors.grey.shade400),
        backgroundColor: Colors.white,
      ),
    );
  }
}