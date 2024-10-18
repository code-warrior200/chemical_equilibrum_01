// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './screens/HomeScreen.dart';
import './screens/SimulationScreen.dart';
import './screens/TutorialScreen.dart';

void main() {
  runApp(ChemicalEquilibriumApp());
}

class ChemicalEquilibriumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chemical Equilibrium',
      debugShowCheckedModeBanner: false, // Removes the debug banner
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/tutorial': (context) => TutorialScreen(),
        '/simulation': (context) => SimulationScreen(),
      },
    );
  }
}
