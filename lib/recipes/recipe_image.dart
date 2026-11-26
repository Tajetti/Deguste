import 'package:flutter/material.dart';

class RecipeImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BorderRadius borderRadius;

  const RecipeImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        width: width,
        height: height,
        child: Image.network(
          url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progresso) {
            if (progresso == null) return child;
            return const _Cinza();
          },
          errorBuilder: (context, error, stackTrace) =>
              const _Cinza(comIcone: true),
        ),
      ),
    );
  }
}

class _Cinza extends StatelessWidget {
  final bool comIcone;

  const _Cinza({this.comIcone = false});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFE9E4DD),
      child: comIcone
          ? const Center(
              child: Icon(Icons.restaurant, color: Color(0xFFB8AFA5)),
            )
          : null,
    );
  }
}
