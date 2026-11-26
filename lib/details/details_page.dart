import 'package:flutter/material.dart';
import 'package:projetodeguste/recipes/recipe.dart';
import 'header/details_header.dart';
import 'info/details_info.dart';
import 'ingredients/details_ingredients.dart';
import 'steps/details_steps.dart';

class DetailsPage extends StatelessWidget {
  final Recipe recipe;

  const DetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    const creme = Color(0xFFFBF5EA);

    return Scaffold(
      backgroundColor: creme,

      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              DetailsHeader(recipe: recipe),

              Padding(
                padding: const EdgeInsets.only(top: DetailsHeader.altura - 28),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                  decoration: const BoxDecoration(
                    color: creme,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailsInfo(recipe: recipe),
                      const SizedBox(height: 24),
                      DetailsIngredients(recipe: recipe),
                      const SizedBox(height: 12),
                      DetailsSteps(recipe: recipe),
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
