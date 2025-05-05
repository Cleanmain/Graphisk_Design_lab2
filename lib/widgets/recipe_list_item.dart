import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/Mainingredient.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  Widget _image(Recipe recipe) {
    var flagImage = Cuisine.flag(recipe.cuisine, width: 24.0);

    return Stack(
      children: [
        // The recipe image (base layer)
        ClipRect(
          child: Container(
            width: 104, // Square width
            height: 104, // Square height
            child: FittedBox(
              fit: BoxFit.cover,
              child: recipe.image,
            ),
          ),
        ),
        // The flag image (overlapping layer)
        if (flagImage != null)
          Positioned(
            bottom: 8,
            right: 8,
            child: flagImage,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Hanterar tryckhändelser
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: 128,
          child: Row(
            children: [
              // Add an image or placeholder for the recipe
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _image(recipe),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(recipe.name, style: AppTheme.mediumHeading),
                    Text(
                      recipe.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0), // Add space from the bottom
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // Align icons to the left
                        children: [
                          // Ingredient Icon
                          if (MainIngredient.labels.contains(recipe.mainIngredient))
                            MainIngredient.icon(recipe.mainIngredient, width: 18)!,

                          // Difficulty Icon
                          if (Difficulty.labels.contains(recipe.difficulty))
                            Difficulty.icon(recipe.difficulty, width: 48)!,
                          SizedBox(width: AppTheme.paddingSmall),

                          // Time
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 16),
                              Text('${recipe.time} min'),
                              SizedBox(width: AppTheme.paddingSmall),
                            ],
                          ),

                          // Price
                          Row(
                            children: [
                              Text('${recipe.price}kr'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}