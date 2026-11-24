import 'package:flutter/material.dart';

class FavoritesHeader extends StatelessWidget {
  // Linha de apoio embaixo do logotipo. Quando for null, não aparece
  // (é o caso da tela "nenhum favorito").
  final String? subtitulo;

  const FavoritesHeader({super.key, this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Degustê',
                style: TextStyle(
                  fontFamily: 'CormorantGaramond',
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF650C1B),
                ),
              ),

              if (subtitulo != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    subtitulo!,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF5F5A58),
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
