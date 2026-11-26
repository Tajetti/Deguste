import 'package:flutter/material.dart';
import 'package:projetodeguste/favorites/favorites_store.dart';
import 'package:projetodeguste/recipes/recipe.dart';
import 'package:projetodeguste/recipes/recipe_image.dart';

class DetailsHeader extends StatelessWidget {
  static const double altura = 300;

  final Recipe recipe;

  const DetailsHeader({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final topo = MediaQuery.paddingOf(context).top;
    final store = FavoritesStore.instance;

    return SizedBox(
      width: double.infinity,
      height: altura,
      child: Stack(
        fit: StackFit.expand,
        children: [
          RecipeImage(url: recipe.image, height: altura),

          Positioned(
            top: topo + 8,
            left: 16,
            child: _BotaoRedondo(
              onTap: () => Navigator.maybePop(context),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black87,
              ),
            ),
          ),

          Positioned(
            top: topo + 8,
            right: 16,
            child: ListenableBuilder(
              listenable: store,
              builder: (context, _) {
                final favorita = store.isFavorite(recipe.id);

                return _BotaoRedondo(
                  onTap: () => store.toggle(recipe),
                  child: Icon(
                    favorita ? Icons.favorite : Icons.favorite_border,
                    size: 22,
                    color: favorita ? const Color(0xFFD62839) : Colors.black87,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BotaoRedondo extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const _BotaoRedondo({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.92),
      shape: const CircleBorder(),
      elevation: 1,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(width: 40, height: 40, child: Center(child: child)),
      ),
    );
  }
}
