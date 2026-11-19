import 'package:flutter/material.dart';
import 'package:projetodeguste/explore/explore_page.dart';

// Estado da tela de favoritos quando o usuário ainda não salvou nenhuma receita
class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Rolagem para não estourar em telas pequenas
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ilustração: pote com coração
            Image.asset('assets/image/pote.png', width: 260),

            const SizedBox(height: 16),

            const Text(
              'Você ainda não tem\nreceitas favoritas.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.3,
                color: Color(0xFF4A3F3B),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Explore nossas receitas e toque\nno coração para salvar.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                height: 1.5,
                color: Color(0xFF5F5A58),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExplorePage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      const WidgetStatePropertyAll(Color(0xFFb55235)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Text(
                  'Explorar receitas',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
