import 'package:flutter/material.dart';
import 'package:projetodeguste/home/footer/home_footer.dart';
import 'package:projetodeguste/home/home_page.dart';
import 'header/explore_header.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF5EA),

      body: Column(
        children: [
          ExploreHeader(
            onSearchTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(focarBusca: true),
                ),
                (route) => false,
              );
            },
          ),

          const Expanded(child: SizedBox()),
        ],
      ),

      bottomNavigationBar: const HomeFooter(),
    );
  }
}
