import 'package:flutter/material.dart';

class FavoritesHeader extends StatelessWidget {
  const FavoritesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Degustê',
            style: TextStyle(
              fontFamily: 'CormorantGaramond',
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Color(0xFF650C1B),
            ),
          ),
        ),
      ),
    );
  }
}
