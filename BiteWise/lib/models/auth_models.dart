import 'dart:convert';

class LoginResponse {
  final String token;
  final String type;
  final String message;

  LoginResponse({required this.token, required this.type, required this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] ?? '',
      type: json['type'] ?? 'Bearer',
      message: json['message'] ?? 'Login bem-sucedido',
    );
  }
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class RegisterRequest {
  final String name;
  final String email;
  final String password;

  RegisterRequest({required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}