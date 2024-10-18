// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chemical Equilibrium',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal, // Modern AppBar color
        elevation: 3, // Adds some shadow for a modern look
      ),
      body: Container(
        // Adding a subtle gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.teal.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Consistent padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Welcome text to engage the user
                Text(
                  'Welcome to Chemical Equilibrium Software',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800, // Subtle text color
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40), // Add space between text and buttons

                // Styled Tutorial Button
                _buildHomeButton(
                  context,
                  label: 'Tutorials',
                  onPressed: () {
                    Navigator.pushNamed(context, '/tutorial');
                  },
                  icon: Icons.school,
                ),
                SizedBox(height: 20), // Add space between buttons

                // Styled Simulation Button
                _buildHomeButton(
                  context,
                  label: 'Simulations',
                  onPressed: () {
                    Navigator.pushNamed(context, '/simulation');
                  },
                  icon: Icons.science,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build a custom-styled button
  Widget _buildHomeButton(BuildContext context, {
    required String label,
    required VoidCallback onPressed,
    required IconData icon,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
        backgroundColor: Colors.teal, // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        elevation: 3, // Shadow for modern look
      ),
      icon: Icon(
        icon,
        size: 24,
        color: Colors.white, // Icon color
      ),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 18, // Font size for buttons
          fontWeight: FontWeight.bold,
          color: Colors.white, // Text color
        ),
      ),
    );
  }
}
