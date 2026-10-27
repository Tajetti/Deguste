import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),

            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Buscar receitas...',

                  prefixIcon: Icon(Icons.search),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none
                  )
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.only(top: 10, left: 30, right: 30),
            child: FilledButton(
              onPressed: () {
                print('Filled Button Pressed');

              },
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text('Explorar receitas'),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xFFb55235)),
                minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50))
              ),
            ),
          )

        ],
      ),
    );
  }
}
