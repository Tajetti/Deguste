import 'package:flutter/material.dart';
import 'package:projetodeguste/home/footer/home_footer.dart';
import 'form/search_form.dart';
import 'header/search_header.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF5EA),

      // Quando o teclado abre, a ilustração fica parada atrás dele
      resizeToAvoidBottomInset: false,

      body: Container(
        width: double.infinity,
        height: double.infinity,

        // Fundo com a tigela de tomates (alinhado embaixo para ela não ser cortada)
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/tomatos.png'),
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
        ),

        child: const Column(
          children: [
            SearchHeader(), // Chama o header
            SearchForm(), // Chama o campo e o botão
          ],
        ),
      ),

      bottomNavigationBar: const HomeFooter(selectedIndex: 1), // Buscar marcado
    );
  }
}
