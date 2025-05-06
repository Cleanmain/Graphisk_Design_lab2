

import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  Widget _image(Recipe recipe) {
    var flagImage = Cuisine.flag(recipe.cuisine, width: 60.0);

    return Stack(
      children: [
        ClipRect(
          child: SizedBox(
            width: 240,
            height: 240,
            child:FittedBox(
              fit: BoxFit.cover,
              child: recipe.image
            ),
          ),
        ),
        if (flagImage != null)
          Positioned(
            bottom: 8,
            right: 8,
            child: flagImage,
          ),
      ],

    );
  }

  Widget _ingredientList(Recipe recipe) {
    var ingredients = recipe.ingredients;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredients.map((ingredient) {
        return Text(
        "$ingredient",
        style: TextStyle(fontSize: 16),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _image(recipe),
                  ),
                Text("Ingridienser"),
                Text("${recipe.servings} portioner"),
                const SizedBox(height: 8),
                _ingredientList(recipe),
                
              ],
            ),
            

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recipe.name,
                  style: AppTheme.largeHeading)
                ]
              )
              
                
            ),

            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                uiController.deselectRecipe();
              },
            ),
          ],
        ),
      ),
    );
  }
}