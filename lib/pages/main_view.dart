import 'package:flutter/material.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/widgets/control_panel.dart';
import 'package:lab2/widgets/recipe_area.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);
    return Scaffold(
      body: Row(
        children: const [
          ControlPanel(), // Replaces _controlPanel
          SizedBox(width: 6),
          RecipeArea(),
        ],
      ),
    );
  }
}