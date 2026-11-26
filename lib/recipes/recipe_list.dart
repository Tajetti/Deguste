import 'package:flutter/material.dart';
import 'package:projetodeguste/details/details_page.dart';
import 'recipe.dart';
import 'recipe_card.dart';

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes;

  final bool comFavorito;

  final ScrollController? controller;

  final bool carregandoMais;

  const RecipeList({
    super.key,
    required this.recipes,
    this.comFavorito = false,
    this.controller,
    this.carregandoMais = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      itemCount: recipes.length + (carregandoMais ? 1 : 0),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index >= recipes.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: CircularProgressIndicator(color: Color(0xFFb55235)),
            ),
          );
        }

        final receita = recipes[index];

        return RecipeCard(
          recipe: receita,
          comFavorito: comFavorito,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(recipe: receita),
              ),
            );
          },
        );
      },
    );
  }
}
