import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Center(
              child: Transform.translate(
                offset: Offset(0, 30),
                child: Image.asset(
                  'assets/image/leaves.png',
                  width: 200,
                  height: 100,
                ),
              )
            ),
          ),
          Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Degustê',
                  style: TextStyle(
                    fontFamily: 'CormorantGaramond',
                    fontSize: 64,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF650C1B),
                  ),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Descubra receitas\npara todos os momentos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w300,
                height: 1.5,
                color: Color(0xFF650C1B),
              ),
            ),
          ),
        ], // Fecha children
      ), // Fecha Column
    ); // Fecha SafeArea
  } // Fecha build
} // Fecha HomeHeader