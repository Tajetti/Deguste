import 'package:flutter/material.dart';
import 'package:projetodeguste/app.dart';
import 'package:projetodeguste/favorites/favorites_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FavoritesStore.instance.load(); // Lê os favoritos salvos no aparelho
  runApp(const App());
}