import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: Color(0xFFFFE2D6),
      selectedIndex: 0,

      onDestinationSelected: (index) {
        // Início: volta para a tela inicial (se já estiver nela, não faz nada)
        if (index == 0) {
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      },

      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home, color: Color(0xFFb55235)),
          label: 'Início',
        ),
        NavigationDestination(
          icon: Icon(Icons.search),
          selectedIcon: Icon(Icons.search, color: Color(0xFFb55235)),
          label: 'Buscar',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.favorite, color: Color(0xFFb55235)),
          label: 'Favoritos',
        )
      ],
    );
  }
}
