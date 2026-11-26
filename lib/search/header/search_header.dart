import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
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

            const Padding(
              padding: EdgeInsets.only(left: 8, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buscar receitas',
                    style: TextStyle(
                      fontFamily: 'CormorantGaramond',
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF650C1B),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Digite o nome da receita para pesquisar na nossa base.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      height: 1.5,
                      color: Color(0xFF5F5A58),
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
