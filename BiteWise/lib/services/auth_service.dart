import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/auth_models.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

class AuthService {
  static const String _baseUrl = 'https://bitewise-api-spring.fly.dev/api/auth';

  static const String _tokenKey = 'jwt_token';

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<LoginResponse> login(String email, String password) async {
    final requestBody = LoginRequest(email: email, password: password);
    final url = Uri.parse('$_baseUrl/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody.toJson()),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(utf8.decode(response.bodyBytes));
      final token = responseData['token'];

      final loginResponse = LoginResponse(token: token, type: 'Bearer', message: responseData['message'] ?? 'Login bem-sucedido');

      await _saveToken(loginResponse.token);
      return loginResponse;
    } else {
      String errorMsg = 'Credenciais inválidas.';
      try {
        final errorJson = jsonDecode(utf8.decode(response.bodyBytes));
        errorMsg = errorJson['message'] ?? 'Erro desconhecido.';
      } catch (_) {}

      throw Exception('Falha no login: $errorMsg Status: ${response.statusCode}');
    }
  }

  Future<void> register(String name, String email, String password) async {
    final requestBody = RegisterRequest(name: name, email: email, password: password);
    final url = Uri.parse('$_baseUrl/register');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody.toJson()),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      String errorMsg = 'Falha no registro: Verifique os dados.';
      try {
        final errorJson = jsonDecode(utf8.decode(response.bodyBytes));
        errorMsg = errorJson['message'] ?? errorMsg;
      } catch (_) {}

      throw Exception('Falha no registro: $errorMsg Status: ${response.statusCode}');
    }
  }
}