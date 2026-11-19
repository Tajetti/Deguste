import 'package:flutter/material.dart';

class ExploreHeader extends StatelessWidget {
  final VoidCallback? onSearchTap;

  const ExploreHeader({super.key, this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 12, top: 16, bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
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
                  const SizedBox(height: 4),
                  const Text(
                    'Receitas deliciosas\npara você se inspirar.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 1.4,
                      color: Color(0xFF5F5A58),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: IconButton(
                onPressed: onSearchTap,
                icon: const Icon(Icons.search, size: 30, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
