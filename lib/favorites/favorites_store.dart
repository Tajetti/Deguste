import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:projetodeguste/recipes/recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Guarda as receitas favoritas. As telas "escutam" este objeto e se
// atualizam sozinhas quando o usuário favorita ou desfavorita uma receita.
class FavoritesStore extends ChangeNotifier {
  FavoritesStore._();

  // Uma única instância para o app inteiro
  static final FavoritesStore instance = FavoritesStore._();

  static const String _chave = 'receitas_favoritas';

  final List<Recipe> _receitas = [];

  List<Recipe> get receitas => List.unmodifiable(_receitas);

  bool isFavorite(int id) => _receitas.any((receita) => receita.id == id);

  // Lê os favoritos salvos no aparelho (chamado quando o app abre)
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
      // Se não conseguir ler, o app só começa sem favoritos
    }
    notifyListeners();
  }

  // Favorita se ainda não é favorita, e desfavorita se já é
  Future<void> toggle(Recipe recipe) async {
    if (isFavorite(recipe.id)) {
      _receitas.removeWhere((receita) => receita.id == recipe.id);
    } else {
      _receitas.insert(0, recipe); // A mais nova aparece primeiro
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
      // Se não conseguir salvar, o favorito continua valendo até fechar o app
    }
  }
}
