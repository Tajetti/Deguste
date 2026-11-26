class Recipe {
  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int? prepTimeMinutes;
  final int? cookTimeMinutes;
  final int? servings;
  final String difficulty;
  final String cuisine;
  final String image;
  final double? rating;
  final List<String> mealType;

  const Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.image,
    required this.rating,
    required this.mealType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final nome = _texto(json['name']);

    return Recipe(
      id: json['id'] as int,
      name: nome.isEmpty ? 'Receita sem nome' : nome,
      ingredients: _lista(json['ingredients']),
      instructions: _lista(json['instructions']),
      prepTimeMinutes: _inteiro(json['prepTimeMinutes'], minimo: 0),
      cookTimeMinutes: _inteiro(json['cookTimeMinutes'], minimo: 0),
      servings: _inteiro(json['servings'], minimo: 1),
      difficulty: _texto(json['difficulty']),
      cuisine: _texto(json['cuisine']),
      image: _texto(json['image']),
      rating: _nota(json['rating']),
      mealType: _lista(json['mealType']),
    );
  }

  static String _texto(Object? valor) => valor is String ? valor.trim() : '';

  static List<String> _lista(Object? valor) {
    final itens = valor is List ? valor : [valor];
    return itens
        .whereType<String>()
        .where((item) => item.trim().isNotEmpty)
        .toList();
  }

  static int? _inteiro(Object? valor, {required int minimo}) {
    return valor is num && valor >= minimo ? valor.toInt() : null;
  }

  static double? _nota(Object? valor) {
    return valor is num && valor >= 0 ? valor.toDouble() : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
      'prepTimeMinutes': prepTimeMinutes,
      'cookTimeMinutes': cookTimeMinutes,
      'servings': servings,
      'difficulty': difficulty,
      'cuisine': cuisine,
      'image': image,
      'rating': rating,
      'mealType': mealType,
    };
  }

  int? get totalMinutes {
    final preparo = prepTimeMinutes;
    final cozimento = cookTimeMinutes;
    if (preparo == null || cozimento == null) return null;
    return preparo + cozimento;
  }

  String? get notaFormatada => rating?.toStringAsFixed(1).replaceAll('.', ',');

  String get dificuldadePt {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return 'Fácil';
      case 'medium':
        return 'Médio';
      case 'hard':
        return 'Difícil';
      default:
        return difficulty;
    }
  }

  String get culinariaPt {
    const traducoes = {
      'American': 'Americana',
      'Asian': 'Asiática',
      'Brazilian': 'Brasileira',
      'Chinese': 'Chinesa',
      'Cocktail': 'Coquetel',
      'French': 'Francesa',
      'Greek': 'Grega',
      'Hawaiian': 'Havaiana',
      'Indian': 'Indiana',
      'Italian': 'Italiana',
      'Japanese': 'Japonesa',
      'Korean': 'Coreana',
      'Lebanese': 'Libanesa',
      'Mediterranean': 'Mediterrânea',
      'Mexican': 'Mexicana',
      'Moroccan': 'Marroquina',
      'Pakistani': 'Paquistanesa',
      'Russian': 'Russa',
      'Spanish': 'Espanhola',
      'Thai': 'Tailandesa',
      'Turkish': 'Turca',
      'Vietnamese': 'Vietnamita',
    };
    return traducoes[cuisine] ?? cuisine;
  }
}
