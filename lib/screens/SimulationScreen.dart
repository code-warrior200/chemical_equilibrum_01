// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:async';

class SimulationScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  double reactantConcentration = 50.0;
  double productConcentration = 50.0;
  double equilibriumConstant = 1.0; // Represent K (Equilibrium constant)
  String simulationResult = '';

  bool isSimulating = false;
  Timer? _timer;

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
            const SizedBox(height: 20),
            _buildConcentrationSlider(
              title: 'Equilibrium Constant (K)',
              value: equilibriumConstant,
              color: Colors.greenAccent,
              min: 0.1,
              max: 5.0,
              onChanged: (value) {
                setState(() {
                  equilibriumConstant = value;
                });
              },
            ),
            const SizedBox(height: 30),

            // Simulation button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: 40),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ), // Button color
                  elevation: 3,
                ),
                onPressed: isSimulating ? null : _startSimulation,
                child: Text(
                  isSimulating ? 'Simulating...' : 'Simulate Equilibrium',
                  style: const TextStyle(fontSize: 18),
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
    double min = 0,
    double max = 100,
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
              min: min,
              max: max,
              activeColor: color,
              inactiveColor: color.withOpacity(0.2),
              label: value.toStringAsFixed(1),
              onChanged: onChanged,
            ),
            Text(
              '${title.split(" ")[0]}: ${value.toStringAsFixed(1)}',
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

  // Start the simulation
  void _startSimulation() {
    setState(() {
      isSimulating = true;
      simulationResult = '';
    });

    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      _simulateEquilibrium();

      if ((reactantConcentration - productConcentration).abs() < 1) {
        timer.cancel();
        setState(() {
          isSimulating = false;
        });
      }
    });
  }

  // Simulate equilibrium by adjusting concentrations over time
  void _simulateEquilibrium() {
    setState(() {
      double reactionQuotient = productConcentration / reactantConcentration;
      if (reactionQuotient > equilibriumConstant) {
        productConcentration -= 1;
        reactantConcentration += 1;
      } else if (reactionQuotient < equilibriumConstant) {
        productConcentration += 1;
        reactantConcentration -= 1;
      } else {
        simulationResult = 'The system is at equilibrium.';
        _timer?.cancel();
        isSimulating = false;
      }

      simulationResult =
          'Reactants: ${reactantConcentration.toStringAsFixed(1)}, Products: ${productConcentration.toStringAsFixed(1)}';
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
