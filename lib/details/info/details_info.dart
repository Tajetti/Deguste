import 'package:flutter/material.dart';
import 'package:projetodeguste/recipes/recipe.dart';

class DetailsInfo extends StatelessWidget {
  final Recipe recipe;

  const DetailsInfo({super.key, required this.recipe});

  String _minutos(int? valor) => valor == null ? 'N/D' : '$valor min';

  @override
  Widget build(BuildContext context) {
    final nota = recipe.notaFormatada;
    final culinaria = recipe.culinariaPt;
    final porcoes = recipe.servings;
    final faltaTempo =
        recipe.prepTimeMinutes == null || recipe.cookTimeMinutes == null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          recipe.name,
          style: const TextStyle(
            fontFamily: 'CormorantGaramond',
            fontSize: 30,
            fontWeight: FontWeight.w900,
            height: 1.1,
            color: Color(0xFF650C1B),
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            if (nota != null) ...[
              const Icon(Icons.star, size: 18, color: Color(0xFFF5A623)),
              const SizedBox(width: 4),
              Text(
                '$nota / 5',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2B2320),
                ),
              ),
            ],
            if (nota != null && culinaria.isNotEmpty) ...[
              const SizedBox(width: 12),
              Container(width: 1, height: 14, color: const Color(0xFFCFC6BD)),
              const SizedBox(width: 12),
            ],
            Flexible(
              child: Text(
                culinaria,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Color(0xFF8A817B)),
              ),
            ),
          ],
        ),

        if (recipe.mealType.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Tipo de refeição: ${recipe.mealType.join(', ')}',
              style: const TextStyle(fontSize: 14, color: Color(0xFF8A817B)),
            ),
          ),

        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _Caixinha(
                icone: Icons.schedule,
                valor: _minutos(recipe.prepTimeMinutes),
                rotulo: 'preparo',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _Caixinha(
                icone: Icons.soup_kitchen_outlined,
                valor: _minutos(recipe.cookTimeMinutes),
                rotulo: 'cozimento',
              ),
            ),
            if (porcoes != null) ...[
              const SizedBox(width: 10),
              Expanded(
                child: _Caixinha(
                  icone: Icons.person_outline,
                  valor: '$porcoes',
                  rotulo: 'porções',
                ),
              ),
            ],
          ],
        ),

        if (faltaTempo)
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              'N/D: não informado',
              style: TextStyle(fontSize: 11, color: Color(0xFF8A817B)),
            ),
          ),
      ],
    );
  }
}

class _Caixinha extends StatelessWidget {
  final IconData icone;
  final String valor;
  final String rotulo;

  const _Caixinha({
    required this.icone,
    required this.valor,
    required this.rotulo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEADFD3)),
      ),
      child: Row(
        children: [
          Icon(icone, size: 22, color: const Color(0xFF4A3F3B)),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valor,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2B2320),
                  ),
                ),
                Text(
                  rotulo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF8A817B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
