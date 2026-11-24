import 'package:flutter/material.dart';
import 'package:projetodeguste/recipes/recipe.dart';

// Seção "Ingredientes", com um marcador para cada item
class DetailsIngredients extends StatelessWidget {
  final Recipe recipe;

  const DetailsIngredients({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ingredientes',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF2B2320),
          ),
        ),

        const SizedBox(height: 10),

        for (final ingrediente in recipe.ingredients)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8, right: 10, left: 4),
                  child: Icon(Icons.circle, size: 5, color: Color(0xFF4A3F3B)),
                ),
                Expanded(
                  child: Text(
                    ingrediente,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xFF4A3F3B),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
