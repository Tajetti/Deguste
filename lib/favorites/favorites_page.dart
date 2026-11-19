import 'package:flutter/material.dart';
import 'package:projetodeguste/home/footer/home_footer.dart';
import 'empty/favorites_empty.dart';
import 'header/favorites_header.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFBF5EA),

      body: Column(
        children: [
          FavoritesHeader(), // Chama o header

          // Por enquanto só existe o estado "nenhum favorito".
          // Quando houver favoritos salvos, a lista entra no lugar dele.
          Expanded(child: FavoritesEmpty()),
        ],
      ),

      bottomNavigationBar: HomeFooter(selectedIndex: 2), // Favoritos marcado
    );
  }
}
