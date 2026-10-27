import 'package:flutter/material.dart';
import 'package:projetodeguste/home/search/home_search.dart';
import 'header/home_header.dart';
import 'footer/home_footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/homebackground.png'),
            fit: BoxFit.cover
          )
        ),

        child: SafeArea(
          child: Column(
            children: [
              HomeHeader(), // Chama o header
              HomeSearch(), // Chama a pesquisa
            ],
          ),
        ),

      ),
      bottomNavigationBar: HomeFooter(),
    );
  }
}
