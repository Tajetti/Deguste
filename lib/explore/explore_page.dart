import 'package:flutter/material.dart';
import 'package:projetodeguste/home/footer/home_footer.dart';
import 'package:projetodeguste/home/home_page.dart';
import 'package:projetodeguste/recipes/recipe.dart';
import 'package:projetodeguste/recipes/recipe_list.dart';
import 'package:projetodeguste/recipes/recipe_service.dart';
import 'package:projetodeguste/recipes/states/recipes_loading.dart';
import 'package:projetodeguste/recipes/states/state_message.dart';
import 'header/explore_header.dart';

enum _Estado { carregando, sucesso, erro }

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // Quantas receitas vêm a cada vez que a API é chamada
  static const int _porPagina = 10;

  final _service = RecipeService();
  final _scroll = ScrollController();

  final List<Recipe> _receitas = [];
  _Estado _estado = _Estado.carregando;
  int _total = 0;
  bool _carregandoMais = false;

  bool get _temMais => _receitas.length < _total;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_aoRolar);
    _carregarPrimeiraPagina();
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _carregarPrimeiraPagina() async {
    setState(() => _estado = _Estado.carregando);

    try {
      final pagina = await _service.listar(limit: _porPagina, skip: 0);
      if (!mounted) return;

      setState(() {
        _receitas
          ..clear()
          ..addAll(pagina.receitas);
        _total = pagina.total;
        _estado = _Estado.sucesso;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _estado = _Estado.erro);
    }
  }

  // Quando chega perto do fim da lista, carrega as próximas receitas
  void _aoRolar() {
    final posicao = _scroll.position;
    if (posicao.pixels >= posicao.maxScrollExtent - 300) {
      _carregarMais();
    }
  }

  Future<void> _carregarMais() async {
    if (_carregandoMais || !_temMais || _estado != _Estado.sucesso) return;

    setState(() => _carregandoMais = true);

    try {
      final pagina = await _service.listar(
        limit: _porPagina,
        skip: _receitas.length,
      );
      if (!mounted) return;

      setState(() {
        _receitas.addAll(pagina.receitas);
        // Se a API não devolveu nada novo, não tem mais o que carregar
        _total = pagina.receitas.isEmpty ? _receitas.length : pagina.total;
        _carregandoMais = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _carregandoMais = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível carregar mais receitas')),
      );
    }
  }

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
          onPressed: _carregarPrimeiraPagina,
        );

      case _Estado.sucesso:
        return RecipeList(
          recipes: _receitas,
          controller: _scroll,
          carregandoMais: _carregandoMais,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF5EA),

      body: Column(
        children: [
          ExploreHeader(
            // Lupa: volta para a home com o campo de busca já ativo
            onSearchTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(focarBusca: true),
                ),
                (route) => false,
              );
            },
          ),

          Expanded(child: _conteudo()),
        ],
      ),

      bottomNavigationBar: const HomeFooter(),
    );
  }
}
