import 'dart:convert';

import 'package:http/http.dart' as http;
import 'recipe.dart';

// Uma "página" de receitas devolvida pela API
class RecipePage {
  final List<Recipe> receitas;

  // Quantas receitas existem no total (para saber se ainda tem mais para carregar)
  final int total;

  const RecipePage({required this.receitas, required this.total});
}

class RecipeService {
  // Endereço da API. Para trocar de API, é só mudar aqui.
  static const String baseUrl = 'https://dummyjson.com';

  final http.Client _client;

  RecipeService({http.Client? client}) : _client = client ?? http.Client();

  // Lista de receitas, de pouco em pouco (paginação)
  Future<RecipePage> listar({int limit = 10, int skip = 0}) {
    final url = Uri.parse('$baseUrl/recipes').replace(
      queryParameters: {'limit': '$limit', 'skip': '$skip'},
    );
    return _buscarPagina(url);
  }

  // Busca receitas pelo nome
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
