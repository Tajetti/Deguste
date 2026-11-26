import 'package:flutter/material.dart';

class ResultsHeader extends StatelessWidget {
  final String termo;

  final int? quantidade;

  final VoidCallback onLimpar;

  const ResultsHeader({
    super.key,
    required this.termo,
    required this.onLimpar,
    this.quantidade,
  });

  @override
  Widget build(BuildContext context) {
    final temResultados = quantidade != null && quantidade! > 0;

    return SafeArea(
      bottom: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 24, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.maybePop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 22,
                color: Colors.black87,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8, top: 12),
              child: Text(
                'Resultados para\n“$termo”',
                style: const TextStyle(
                  fontFamily: 'CormorantGaramond',
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                  color: Color(0xFF650C1B),
                ),
              ),
            ),

            if (temResultados)
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        quantidade == 1
                            ? '1 receita encontrada.'
                            : '$quantidade receitas encontradas.',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF5F5A58),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: onLimpar,
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFFb55235),
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Limpar pesquisa',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
