import 'package:flutter/material.dart';

// Bloco usado nas telas "Nenhum favorito", "Nenhum resultado" e
// "Erro ao carregar": ilustração, título, texto de apoio e um botão.
class StateMessage extends StatelessWidget {
  // Caminho da ilustração em assets/image/
  final String imagem;

  // Ícone mostrado no lugar da ilustração se o arquivo não existir
  final IconData iconeReserva;

  final String titulo;
  final String subtitulo;
  final String textoBotao;
  final VoidCallback onPressed;
  final double larguraImagem;

  const StateMessage({
    super.key,
    required this.imagem,
    required this.iconeReserva,
    required this.titulo,
    required this.subtitulo,
    required this.textoBotao,
    required this.onPressed,
    this.larguraImagem = 260,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      // Rolagem para não estourar em telas pequenas
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagem,
              width: larguraImagem,
              errorBuilder: (context, error, stackTrace) =>
                  _IlustracaoReserva(icone: iconeReserva),
            ),

            const SizedBox(height: 16),

            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.3,
                color: Color(0xFF4A3F3B),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              subtitulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                height: 1.5,
                color: Color(0xFF5F5A58),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor:
                      const WidgetStatePropertyAll(Color(0xFFb55235)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: Text(
                  textoBotao,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Círculo com um ícone, usado enquanto a ilustração não estiver nos assets
class _IlustracaoReserva extends StatelessWidget {
  final IconData icone;

  const _IlustracaoReserva({required this.icone});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: const BoxDecoration(
        color: Color(0xFFF3E3DA),
        shape: BoxShape.circle,
      ),
      child: Icon(icone, size: 64, color: const Color(0xFFb55235)),
    );
  }
}
