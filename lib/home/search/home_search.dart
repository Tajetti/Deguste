import 'package:flutter/material.dart';
import 'package:projetodeguste/explore/explore_page.dart';
import 'package:projetodeguste/results/results_page.dart';

class HomeSearch extends StatefulWidget {
  final bool autofocus;

  const HomeSearch({super.key, this.autofocus = false});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  final receita = TextEditingController();

  bool get temTexto => receita.text.trim().isNotEmpty;

  String? error;

  void pesquisarReceita() {
    final textoReceita = receita.text.trim();

    if(textoReceita.length < 3) {
      setState(() {
        error = "A receita precisa conter pelo menos 3 caracteres";
      });
      return;
    }

    setState(() {
      error = null;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(termo: textoReceita),
      ),
    );

    receita.clear();
    setState(() {

    });
  }

  void limparPesquisa(){
    receita.clear();
    setState(() {
      error = null;
    });
  }

  @override
  void dispose() {
    receita.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.only(left: 30, right: 30),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30),

              child: TextField(
                controller: receita,

                autofocus: widget.autofocus,

                onChanged: (texto) {setState(() {});},

                decoration: InputDecoration(
                    hintText: 'Buscar receitas...',

                    prefixIcon: Icon(Icons.search),

                    suffixIcon: temTexto ? IconButton(
                      onPressed: limparPesquisa,
                      icon: Icon(Icons.close, color: Colors.grey),
                    ) : null,

                    filled: true,

                    fillColor: Colors.white,

                    errorText: error,
                    helperText: '   ',

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none
                    )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 14),
              child: FilledButton(
                onPressed: () {
                  if(temTexto){
                    pesquisarReceita();
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ExplorePage()),
                    );
                  }
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(temTexto ? 'Pesquisar' : 'Explorar receitas'),
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
      )
    );
  }
}
