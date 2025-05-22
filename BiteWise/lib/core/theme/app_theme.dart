import 'package:flutter/material.dart';

class AppTheme {
  // cores primarias

  static const Color vermelhoTomate = Color.fromRGBO(192, 57, 43, 1);
  static const Color laranjaPaprika = Color.fromRGBO(211, 84, 0, 1);
  static const Color laranjaMel = Color.fromRGBO(243, 156, 18, 1);
  static const Color verdeMarProfundo = Color.fromRGBO(17, 122, 101, 1);
  static const Color preto = Colors.black;
  static const Color branco = Colors.white;
  static const Color aquamarinaMedia = Color.fromRGBO(102, 205, 175, 0.75);
  static const Color vermelhoSecundario = Color.fromRGBO(192, 57, 43, 1);
  static const Color cinzaNuvem = Color.fromRGBO(177, 180, 181, 1);
  static const Color cinzaClaro = Color.fromRGBO(229, 231, 233, 1);

  // cores com opacidade menor

  static const Color cinzaNuvem060 = Color.fromRGBO(177, 180, 181, 0.60);
  static const Color preto025 = Color.fromRGBO(0, 0, 0, 0.25);
  static const Color preto050 = Color.fromRGBO(0, 0, 0, 0.50);
  static const Color branco075 = Color.fromRGBO(255, 255, 255, 0.75);

  // estilos do "header_widget.dart"

  static final headerElevatedButton = ElevatedButton.styleFrom(
    backgroundColor: AppTheme.laranjaMel,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  static final buttonTextStyle = TextStyle(fontSize: 16, color: AppTheme.preto);

  // estilo do "custom_link.dart"

  static final linkTextStyle = TextStyle(
    color: AppTheme.branco,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  // estilos do "recipe_generation.dart"

  static final textFieldDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: AppTheme.cinzaNuvem060,
  );

  static final recipeGenerationButton = ElevatedButton.styleFrom(
    backgroundColor: AppTheme.verdeMarProfundo,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
