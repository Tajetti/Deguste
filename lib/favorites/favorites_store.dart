import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:projetodeguste/recipes/recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesStore extends ChangeNotifier {
  FavoritesStore._();

  static final FavoritesStore instance = FavoritesStore._();

  static const String _chave = 'receitas_favoritas';

  final List<Recipe> _receitas = [];

  List<Recipe> get receitas => List.unmodifiable(_receitas);

  bool isFavorite(int id) => _receitas.any((receita) => receita.id == id);

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final salvos = prefs.getStringList(_chave) ?? [];

      _receitas
        ..clear()
        ..addAll(
          salvos.map(
            (texto) => Recipe.fromJson(jsonDecode(texto) as Map<String, dynamic>),
          ),
        );
    } catch (_) {
    }
    notifyListeners();
  }

  Future<void> toggle(Recipe recipe) async {
    if (isFavorite(recipe.id)) {
      _receitas.removeWhere((receita) => receita.id == recipe.id);
    } else {
      _receitas.insert(0, recipe);
    }
    notifyListeners();
    await _salvar();
  }

  Future<void> _salvar() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(
        _chave,
        _receitas.map((receita) => jsonEncode(receita.toJson())).toList(),
      );
    } catch (_) {
    }
  }
}
