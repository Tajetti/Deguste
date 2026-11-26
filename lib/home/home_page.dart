import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projetodeguste/home/search/home_search.dart';
import 'package:projetodeguste/recipes/recipe_service.dart';
import 'header/home_header.dart';
import 'footer/home_footer.dart';

class HomePage extends StatefulWidget {
  final bool focarBusca;

  final RecipeService? service;

  const HomePage({super.key, this.focarBusca = false, this.service});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    (widget.service ?? RecipeService.instance).primeiraPagina().ignore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/homebackground.png'),
            fit: BoxFit.cover
          )
        ),

        child: SafeArea(
          child: Column(
            children: [
              HomeHeader(),
              HomeSearch(autofocus: widget.focarBusca),
            ],
          ),
        ),

      ),
      bottomNavigationBar: HomeFooter(),
    );
  }
}
