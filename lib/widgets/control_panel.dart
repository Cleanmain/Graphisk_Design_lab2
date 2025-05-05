import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';

class ControlPanel extends StatelessWidget {
  final double width;

  const ControlPanel({super.key, this.width = 320});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Column(
        children: [
          Logo(),
          
          const Text('Receptsök\n'),
          const Text(
            'Hitta ett recept som passar dig!',
          ),
          const SizedBox(height: 20),
          IngredientControl(),
          const SizedBox(height: 5),
          KitchenControl(),
          const SizedBox(height: 20),
          Text(
            'Svårighetsgrad:', 
          style: AppTheme.smallHeading()
          ),
          const DifficulyControl(),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text('Maxpris:', style: AppTheme.smallHeading()),
              PriceControl(),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text('Maxtid:', style: AppTheme.smallHeading()),
              TimeControl(),
            ],
          ),
        ],
      ),
    );
  }
}