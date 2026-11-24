import 'package:flutter/material.dart';
import 'package:projetodeguste/home/footer/home_footer.dart';
import 'package:projetodeguste/recipes/recipe.dart';
import 'package:projetodeguste/recipes/recipe_list.dart';
import 'package:projetodeguste/recipes/recipe_service.dart';
import 'package:projetodeguste/recipes/states/recipes_loading.dart';
import 'package:projetodeguste/recipes/states/state_message.dart';
import 'header/results_header.dart';

enum _Estado { carregando, sucesso, erro }

class ResultsPage extends StatefulWidget {
  // O que o usuário pesquisou
  final String termo;

  // Normalmente não precisa passar. Serve para trocar o serviço (ex.: em testes).
  final RecipeService? service;

  const ResultsPage({super.key, required this.termo, this.service});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  late final RecipeService _service = widget.service ?? RecipeService();

  List<Recipe> _receitas = [];
  _Estado _estado = _Estado.carregando;

  @override
  void initState() {
    super.initState();
    _buscar();
  }

  Future<void> _buscar() async {
    setState(() => _estado = _Estado.carregando);

    try {
      final pagina = await _service.buscar(widget.termo);
      if (!mounted) return;

      setState(() {
        _receitas = pagina.receitas;
        _estado = _Estado.sucesso;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _estado = _Estado.erro);
    }
  }

  // "Limpar pesquisa": volta para a tela anterior avisando que o campo deve ser limpo
  void _limpar() => Navigator.pop(context, true);

  Widget _conteudo() {
    switch (_estado) {
      case _Estado.carregando:
        return const RecipesLoading();

      case _Estado.erro:
        return StateMessage(
          imagem: 'assets/image/panela.png', // Panela com "!"
          iconeReserva: Icons.cloud_off_outlined,
          titulo: 'Não foi possível\ncarregar as receitas.',
          subtitulo: 'Verifique sua conexão com a internet\ne tente novamente.',
          textoBotao: 'Tentar novamente',
          onPressed: _buscar,
        );

      case _Estado.sucesso:
        if (_receitas.isEmpty) {
          return StateMessage(
            imagem: 'assets/image/lupa.png', // Lupa
            iconeReserva: Icons.search_off,
            titulo: 'Nenhum resultado encontrado.',
            subtitulo: 'Não encontramos receitas para esse nome.\nTente outro termo.',
            textoBotao: 'Limpar pesquisa',
            onPressed: _limpar,
          );
        }

        return RecipeList(recipes: _receitas, comFavorito: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF5EA),

      body: Column(
        children: [
          ResultsHeader(
            termo: widget.termo,
            quantidade: _estado == _Estado.sucesso ? _receitas.length : null,
            onLimpar: _limpar,
          ),

          Expanded(child: _conteudo()),
        ],
      ),

      bottomNavigationBar: const HomeFooter(selectedIndex: 1), // Buscar marcado
    );
  }
}
