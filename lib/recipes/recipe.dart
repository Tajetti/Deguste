// Receita como a API devolve (https://dummyjson.com/recipes)
class Recipe {
  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final String image;
  final double rating;

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
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as int,
      name: json['name'] as String,
      ingredients: List<String>.from(json['ingredients'] ?? const []),
      instructions: List<String>.from(json['instructions'] ?? const []),
      prepTimeMinutes: (json['prepTimeMinutes'] as num?)?.toInt() ?? 0,
      cookTimeMinutes: (json['cookTimeMinutes'] as num?)?.toInt() ?? 0,
      servings: (json['servings'] as num?)?.toInt() ?? 0,
      difficulty: json['difficulty'] as String? ?? '',
      cuisine: json['cuisine'] as String? ?? '',
      image: json['image'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
    );
  }

  // Usado para salvar os favoritos no aparelho
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
    };
  }

  // Tempo total (preparo + cozimento), como aparece nos cards: "35 min"
  int get totalMinutes => prepTimeMinutes + cookTimeMinutes;

  // Nota com vírgula, como no layout: "4,6"
  String get notaFormatada => rating.toStringAsFixed(1).replaceAll('.', ',');

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
