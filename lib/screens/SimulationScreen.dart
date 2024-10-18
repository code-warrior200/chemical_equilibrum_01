// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class SimulationScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  double reactantConcentration = 50.0;
  double productConcentration = 50.0;

  // Add a variable to store the simulation result
  String simulationResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemical Equilibrium Simulation'),
        elevation: 0, // Modern flat style
        backgroundColor: Colors.teal, // Modern color for AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0), // Consistent padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title
            const Text(
              'Adjust Concentrations',
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.w600,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            
            // Concentration Sliders Section
            _buildConcentrationSlider(
              title: 'Reactant Concentration',
              value: reactantConcentration,
              color: Colors.blueAccent,
              onChanged: (value) {
                setState(() {
                  reactantConcentration = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildConcentrationSlider(
              title: 'Product Concentration',
              value: productConcentration,
              color: Colors.redAccent,
              onChanged: (value) {
                setState(() {
                  productConcentration = value;
                });
              },
            ),
            
            const SizedBox(height: 30),
            
            // Simulation button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40), backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ), // Button color
                  elevation: 3,
                ),
                onPressed: () {
                  // Trigger simulation logic here and update the result
                  _simulateEquilibrium();
                },
                child: const Text(
                  'Simulate Equilibrium',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Display simulation results
            _buildSimulationResultCard(),
          ],
        ),
      ),
    );
  }

  // Helper method to build styled sliders
  Widget _buildConcentrationSlider({
    required String title,
    required double value,
    required Color color,
    required ValueChanged<double> onChanged,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Slider(
              value: value,
              min: 0,
              max: 100,
              activeColor: color,
              inactiveColor: color.withOpacity(0.2),
              label: value.round().toString(),
              onChanged: onChanged,
            ),
            Text(
              '${title.split(" ")[0]} Concentration: ${value.toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to simulate the equilibrium and set the result
  void _simulateEquilibrium() {
    setState(() {
      // Simple simulation: just compare the concentrations
      if (reactantConcentration > productConcentration) {
        simulationResult = 'Reactants dominate the equilibrium.';
      } else if (productConcentration > reactantConcentration) {
        simulationResult = 'Products dominate the equilibrium.';
      } else {
        simulationResult = 'The system is at equilibrium.';
      }
    });
  }

  // Display the simulation result dynamically
  Widget _buildSimulationResultCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            simulationResult.isEmpty
                ? 'Simulation Results Here'
                : simulationResult,
            style: TextStyle(
              fontSize: 18,
              color: simulationResult.isEmpty ? Colors.grey : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
