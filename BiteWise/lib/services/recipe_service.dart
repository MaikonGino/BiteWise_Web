import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/recipe_models.dart';

class RecipeService {
  // CRÍTICO: URL do Backend (Fly.io ou localhost)
  static const String _baseUrl = 'http://10.0.2.2:8080/api/recipes';

  final String _tokenKey = 'jwt_token';

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    if (token == null) {
      throw Exception('Usuário não autenticado. Token não encontrado.');
    }
    return token;
  }

  // Cabeçalhos comuns com o token JWT
  Future<Map<String, String>> _getHeaders() async {
    final token = await _getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // Função que lida com a GERAÇÃO e MODIFICAÇÃO (ambas usam a mesma lógica HTTP)
  Future<RecipeResponse> processRecipe(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final headers = await _getHeaders();

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(utf8.decode(response.bodyBytes));
      return RecipeResponse.fromJson(responseData);
    } else {
      String errorMsg = 'Falha na requisição.';
      try {
        final errorJson = jsonDecode(utf8.decode(response.bodyBytes));
        errorMsg = errorJson['message'] ?? 'Erro no servidor: ${response.statusCode}';
      } catch (_) {}

      throw Exception('Erro ao processar receita: $errorMsg');
    }
  }

  Future<RecipeResponse> generateRecipe(List<String> ingredients) {
    return processRecipe(
      'generate',
      {'ingredients': ingredients},
    );
  }

  Future<RecipeResponse> modifyRecipe(String originalRecipeJson, String instruction) {
    return processRecipe(
      'modify',
      {
        'originalRecipeJson': originalRecipeJson,
        'modificationInstruction': instruction,
      },
    );
  }
}