import 'package:flutter/material.dart';
import 'package:projetodeguste/explore/explore_page.dart';
import 'package:projetodeguste/recipes/states/state_message.dart';

// Estado da tela de favoritos quando o usuário ainda não salvou nenhuma receita
class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return StateMessage(
      imagem: 'assets/image/pote.png', // Pote com coração
      iconeReserva: Icons.favorite_border,
      titulo: 'Você ainda não tem\nreceitas favoritas.',
      subtitulo: 'Explore nossas receitas e toque\nno coração para salvar.',
      textoBotao: 'Explorar receitas',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ExplorePage()),
        );
      },
    );
  }
}
