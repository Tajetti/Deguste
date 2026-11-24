import 'package:flutter/material.dart';
import 'package:projetodeguste/favorites/favorites_page.dart';
import 'package:projetodeguste/search/search_page.dart';

class HomeFooter extends StatelessWidget {
  final int selectedIndex;

  const HomeFooter({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: Color(0xFFFFE2D6),
      selectedIndex: selectedIndex,

      onDestinationSelected: (index) {
        if (index == 0) {
          Navigator.popUntil(context, (route) => route.isFirst);
        }

        if (index == 1 && selectedIndex != 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchPage()),
          );
        }

        if (index == 2 && selectedIndex != 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FavoritesPage()),
          );
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
