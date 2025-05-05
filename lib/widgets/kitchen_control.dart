import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:provider/provider.dart';


class KitchenControl extends StatefulWidget {
  const KitchenControl({super.key});

  @override
  _KitchenControlState createState() => _KitchenControlState();
}

class _KitchenControlState extends State<KitchenControl> {
  String _selectedCuisine = Cuisine.labels[0]; // Default selected value

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    const labels = Cuisine.labels;
    final flags = Cuisine.flags;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Kök:'),
        SizedBox(width: AppTheme.paddingSmall),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButton<String>(
            value: _selectedCuisine, // Dynamically updates the selected value
            underline: const SizedBox(), // Removes the default underline
            isDense: true, // Makes the dropdown compact
            items: [
              for (int i = 0; i < labels.length; i++)
                DropdownMenuItem<String>(
                  value: labels[i],
                  child: Row(
                    children: [
                      if (flags[i] != null) flags[i]!, // Display flag if available
                      SizedBox(width: AppTheme.paddingSmall), // Add spacing between flag and text
                      Text(labels[i]),
                    ],
                  ),
                ),
            ],
            onChanged: (value) {
              setState(() {
                _selectedCuisine = value!; // Update the selected value
              });
              recipeHandler.setCuisine(value); // Update the recipe handler
            },
          ),
        ),
      ],
    );
  }
}