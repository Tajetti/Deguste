import 'package:flutter/material.dart';
import 'package:projetodeguste/home/footer/home_footer.dart';
import 'package:projetodeguste/recipes/recipe_list.dart';
import 'empty/favorites_empty.dart';
import 'favorites_store.dart';
import 'header/favorites_header.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = FavoritesStore.instance;

    return Scaffold(
      backgroundColor: const Color(0xFFFBF5EA),

      // Se atualiza sozinho quando o usuário favorita ou desfavorita algo
      body: ListenableBuilder(
        listenable: store,
        builder: (context, _) {
          final receitas = store.receitas;

          // Nenhum favorito ainda: tela 7
          if (receitas.isEmpty) {
            return const Column(
              children: [
                FavoritesHeader(), // Chama o header
                Expanded(child: FavoritesEmpty()),
              ],
            );
          }

          // Com favoritos: tela 6
          return Column(
            children: [
              const FavoritesHeader(subtitulo: 'Minhas receitas favoritas'),
              Expanded(
                child: RecipeList(recipes: receitas, comFavorito: true),
              ),
            ],
          );
        },
      ),

      bottomNavigationBar: const HomeFooter(selectedIndex: 2), // Favoritos marcado
    );
  }
}
