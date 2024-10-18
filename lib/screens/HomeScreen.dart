// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemical Equilibrium'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tutorial');
              },
              child: const Text('Tutorials'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/simulation');
              },
              child: const Text('Simulations'),
            ),
          ],
        ),
      ),
    );
  }
}
