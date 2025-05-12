import 'package:flutter/material.dart';

class BotaoEstilos {
  static ButtonStyle estiloPadrao() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      textStyle: const TextStyle(
        fontSize: 24, // Aumente aqui conforme necessário
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
