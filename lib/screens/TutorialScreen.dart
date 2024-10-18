// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chemical Equilibrium Tutorial'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'What is Chemical Equilibrium?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Chemical equilibrium occurs when the forward and reverse reactions occur at the same rate...',
              style: TextStyle(fontSize: 16),
            ),
            // Add more tutorial content or media (e.g., images)
          ],
        ),
      ),
    );
  }
}
