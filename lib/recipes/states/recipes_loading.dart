import 'package:flutter/material.dart';

class RecipesLoading extends StatelessWidget {
  final int quantidade;

  const RecipesLoading({super.key, this.quantidade = 4});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      itemCount: quantidade,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) => const _CardEsqueleto(),
    );
  }
}

class _CardEsqueleto extends StatelessWidget {
  const _CardEsqueleto();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 1.5,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const _Bloco(width: 88, height: 88, raio: 12),

            const SizedBox(width: 12),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Barra(largura: 1.0),
                  SizedBox(height: 10),
                  _Barra(largura: 0.7),
                  SizedBox(height: 10),
                  _Barra(largura: 0.4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Barra extends StatelessWidget {
  final double largura;

  const _Barra({required this.largura});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: largura,
      alignment: Alignment.centerLeft,
      child: const _Bloco(height: 12, raio: 6),
    );
  }
}

class _Bloco extends StatelessWidget {
  final double? width;
  final double height;
  final double raio;

  const _Bloco({this.width, required this.height, required this.raio});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFE6E2DD),
        borderRadius: BorderRadius.circular(raio),
      ),
    );
  }
}
