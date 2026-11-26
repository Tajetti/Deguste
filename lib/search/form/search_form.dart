import 'package:flutter/material.dart';
import 'package:projetodeguste/results/results_page.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final receita = TextEditingController();

  String? error;

  bool get temTexto => receita.text.trim().isNotEmpty;

  Future<void> pesquisarReceita() async {
    final textoReceita = receita.text.trim();

    if (textoReceita.length < 3) {
      setState(() {
        error = 'A receita precisa conter pelo menos 3 caracteres';
      });
      return;
    }

    setState(() {
      error = null;
    });

    final limpar = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(termo: textoReceita),
      ),
    );

    if (limpar == true && mounted) {
      limparPesquisa();
    }
  }

  void limparPesquisa() {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          TextField(
            controller: receita,

            textInputAction: TextInputAction.search,

            onChanged: (texto) => setState(() {}),

            onSubmitted: (texto) => pesquisarReceita(),

            decoration: InputDecoration(
              hintText: 'Buscar receitas...',

              prefixIcon: const Icon(Icons.search),

              suffixIcon: temTexto
                  ? IconButton(
                      onPressed: limparPesquisa,
                      icon: const Icon(Icons.close, color: Colors.grey),
                    )
                  : null,

              filled: true,
              fillColor: Colors.white,

              errorText: error,
              helperText: '   ',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 4),

          FilledButton(
            onPressed: pesquisarReceita,
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Color(0xFFb55235)),
              minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 56)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            child: const Text(
              'Pesquisar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
