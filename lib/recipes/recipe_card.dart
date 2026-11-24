import 'package:flutter/material.dart';
import 'package:projetodeguste/favorites/favorites_store.dart';
import 'recipe.dart';
import 'recipe_image.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  // true: mostra o coração de favoritar (resultados e favoritos)
  // false: só a nota, à direita (listagem da tela Explorar)
  final bool comFavorito;

  final VoidCallback? onTap;

  const RecipeCard({
    super.key,
    required this.recipe,
    this.comFavorito = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 1.5,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              RecipeImage(
                url: recipe.image,
                width: 88,
                height: 88,
                borderRadius: BorderRadius.circular(12),
              ),

              const SizedBox(width: 12),

              Expanded(
                // Pelo menos a altura da foto. Cresce se o nome ocupar duas
                // linhas e ainda tiver o coração embaixo.
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 88),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Em cima: nome, tempo e dificuldade
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              color: Color(0xFF2B2320),
                            ),
                          ),

                          const SizedBox(height: 6),

                          // Relógio + tempo total • dificuldade
                          Row(
                            children: [
                              const Icon(
                                Icons.schedule,
                                size: 14,
                                color: Color(0xFF8A817B),
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  '${recipe.totalMinutes} min  •  ${recipe.dificuldadePt}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF8A817B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Embaixo: nota (e coração, quando tiver)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          children: [
                            if (!comFavorito) const Spacer(),
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Color(0xFFF5A623),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              recipe.notaFormatada,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2B2320),
                              ),
                            ),
                            if (comFavorito) const Spacer(),
                            if (comFavorito) _Coracao(recipe: recipe),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Coração que favorita/desfavorita a receita e se atualiza sozinho
class _Coracao extends StatelessWidget {
  final Recipe recipe;

  const _Coracao({required this.recipe});

  @override
  Widget build(BuildContext context) {
    final store = FavoritesStore.instance;

    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        final favorita = store.isFavorite(recipe.id);

        return IconButton(
          onPressed: () => store.toggle(recipe),
          padding: const EdgeInsets.all(4),
          constraints: const BoxConstraints(),
          icon: Icon(
            favorita ? Icons.favorite : Icons.favorite_border,
            size: 24,
            color: favorita ? const Color(0xFFD62839) : Colors.black87,
          ),
        );
      },
    );
  }
}
