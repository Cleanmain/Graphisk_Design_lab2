import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/Mainingredient.dart';
import 'package:provider/provider.dart';



class IngredientControl extends StatefulWidget {
  const IngredientControl({super.key});

  @override
  _IngredientControlState createState() => _IngredientControlState();
}

class _IngredientControlState extends State<IngredientControl> {
  String _selectedIngredient = MainIngredient.labels[0]; // Default selected value

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    const labels = MainIngredient.labels;
    final icons = MainIngredient.icons;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Ingrediens:'),
        SizedBox(width: AppTheme.paddingSmall),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButton<String>(
            value: _selectedIngredient, // Dynamically updates the selected value
            underline: const SizedBox(), // Removes the default underline
            isDense: true, // Makes the dropdown compact
            items: [
              for (int i = 0; i < labels.length; i++)
                DropdownMenuItem<String>(
                  value: labels[i],
                  child: Row(
                    children: [
                      if (icons[i] != null) icons[i]!, // Display icon if available
                      SizedBox(width: AppTheme.paddingSmall), // Add spacing between icon and text
                      Text(labels[i]),
                    ],
                  ),
                ),
            ],
            onChanged: (value) {
              setState(() {
                _selectedIngredient = value!; // Update the selected value
              });
              recipeHandler.setMainIngredient(value); // Update the recipe handler
            },
          ),
        ),
      ],
    );
  }
}