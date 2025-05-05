import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:provider/provider.dart';



class DifficulyControl extends StatefulWidget {
   const DifficulyControl({super.key});

   @override
   State<DifficulyControl> createState() => _DifficulyControlState();
}
class _DifficulyControlState extends State<DifficulyControl> {
  String _difficulty = Difficulty.labels[0]; // Default selected value

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return Column(
      children: [
        for (int i = 0; i < Difficulty.labels.length; i++)
          RadioListTile<String>(
            dense: true,
            title: Row(
              children: [
                if (Difficulty.icons[i] != null) Difficulty.icons[i]!, // Display icon if available
                SizedBox(width: AppTheme.paddingMedium), // Add spacing between icon and text
                Text(Difficulty.labels[i]),
              ],
            ),
            value: Difficulty.labels[i],
            groupValue: _difficulty,
            onChanged: (value) {
              setState(() {
                _difficulty = value!; // Update the selected difficulty
                recipeHandler.setDifficulty(value); // Update the recipe handler
              });
            },
          ),
      ],
    );
  }
}