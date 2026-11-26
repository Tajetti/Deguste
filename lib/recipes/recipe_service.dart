import 'dart:convert';

import 'package:http/http.dart' as http;
import 'recipe.dart';

class RecipePage {
  final List<Recipe> receitas;

  final int total;

  const RecipePage({required this.receitas, required this.total});
}

class RecipeService {
  static const String baseUrl = 'https://dummyjson.com';
  static const int porPagina = 10;

  static final RecipeService instance = RecipeService();

  final http.Client _client;
  Future<RecipePage>? _primeiraPagina;

  RecipeService({http.Client? client}) : _client = client ?? http.Client();

  Future<RecipePage> primeiraPagina() {
    return _primeiraPagina ??= _carregarPrimeiraPagina();
  }

  Future<RecipePage> _carregarPrimeiraPagina() async {
    try {
      return await listar();
    } catch (_) {
      _primeiraPagina = null;
      rethrow;
    }
  }

  Future<RecipePage> listar({int limit = porPagina, int skip = 0}) {
    final url = Uri.parse('$baseUrl/recipes').replace(
      queryParameters: {'limit': '$limit', 'skip': '$skip'},
    );
    return _buscarPagina(url);
  }

  Future<RecipePage> buscar(String termo) {
    final url = Uri.parse('$baseUrl/recipes/search').replace(
      queryParameters: {'q': termo, 'limit': '50'},
    );
    return _buscarPagina(url);
  }

  Future<RecipePage> _buscarPagina(Uri url) async {
    final resposta = await _client
        .get(url)
        .timeout(const Duration(seconds: 15));

    if (resposta.statusCode != 200) {
      throw Exception('Erro ${resposta.statusCode} ao buscar receitas');
    }

    final dados =
        jsonDecode(utf8.decode(resposta.bodyBytes)) as Map<String, dynamic>;

    final receitas = (dados['recipes'] as List)
        .map((item) => Recipe.fromJson(item as Map<String, dynamic>))
        .toList();

    return RecipePage(
      receitas: receitas,
      total: (dados['total'] as num?)?.toInt() ?? receitas.length,
    );
  }
}
