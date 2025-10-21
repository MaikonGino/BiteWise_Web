import 'dart:convert';
import 'package:flutter/foundation.dart';

class NutritionFacts {
  final double calories;
  final double proteinGrams;
  final double fatGrams;
  final double carbsGrams;

  NutritionFacts({
    required this.calories,
    required this.proteinGrams,
    required this.fatGrams,
    required this.carbsGrams,
  });

  factory NutritionFacts.fromJson(Map<String, dynamic> json) {
    // Garante que o valor seja um Double, tratando inteiros ou nulos
    double parseDouble(dynamic value) {
      if (value is int) return value.toDouble();
      if (value is double) return value;
      return 0.0;
    }

    return NutritionFacts(
      calories: parseDouble(json['calories']),
      proteinGrams: parseDouble(json['proteinGrams']),
      fatGrams: parseDouble(json['fatGrams']),
      carbsGrams: parseDouble(json['carbsGrams']),
    );
  }
}

class RecipeResponse {
  final String title;
  final String prepTime;
  final int servings;
  final String difficulty;
  final List<String> ingredients;
  final List<String> steps;
  final List<String> tips;
  final NutritionFacts nutrition;

  RecipeResponse({
    required this.title,
    required this.prepTime,
    required this.servings,
    required this.difficulty,
    required this.ingredients,
    required this.steps,
    required this.tips,
    required this.nutrition,
  });

  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    return RecipeResponse(
      title: json['title'] ?? 'Receita sem título',
      prepTime: json['prepTime'] ?? 'N/D',
      servings: json['servings'] ?? 0,
      difficulty: json['difficulty'] ?? 'N/D',
      // Mapeia listas
      ingredients: List<String>.from(json['ingredients'] ?? []),
      steps: List<String>.from(json['steps'] ?? []),
      tips: List<String>.from(json['tips'] ?? []),
      // Mapeia o objeto aninhado
      nutrition: NutritionFacts.fromJson(json['nutrition'] ?? {}),
    );
  }

  // Método auxiliar para obter o JSON completo da receita para o endpoint /modify
  String toJsonString() {
    return jsonEncode({
      'title': title,
      'prepTime': prepTime,
      'servings': servings,
      'difficulty': difficulty,
      'ingredients': ingredients,
      'steps': steps,
      'tips': tips,
      'nutrition': {
        'calories': nutrition.calories,
        'proteinGrams': nutrition.proteinGrams,
        'fatGrams': nutrition.fatGrams,
        'carbsGrams': nutrition.carbsGrams,
      }
    });
  }
}