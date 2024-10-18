// ignore_for_file: file_names, prefer_const_constructors, unused_element, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chemical Equilibrium Tutorial & Simulation'),
        backgroundColor: Colors.teal, // Modern AppBar color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section for Introduction
            _buildSectionTitle('What is Chemical Equilibrium?'),
            SizedBox(height: 16),
            _buildTextContent(
              'Chemical equilibrium occurs when the forward and reverse reactions happen at the same rate, '
              'leading to no net change in the concentration of reactants and products over time. '
              'At equilibrium, the system is in a dynamic balance, where reactions continue to occur, but the concentrations remain constant.'
            ),
            SizedBox(height: 20),

            // Image to explain equilibrium
            _buildImageCard(
              'https://www.google.com/imgres?q=Graph%20showing%20a%20reaction%20reaching%20chemical%20equilibrium&imgurl=https%3A%2F%2Fstudy.com%2Fcimages%2Fmultimages%2F16%2Fhi_reaction_concentration_graph_with_line1553866909777717444.png&imgrefurl=https%3A%2F%2Fstudy.com%2Fskill%2Flearn%2Fhow-to-identify-chemical-equilibrium-from-a-graph-explanation.html&docid=f2mZKKU-iwnJdM&tbnid=m7VO-UlKC5OWlM&vet=12ahUKEwjWk_X4gpiJAxUiWkEAHU3SJSYQM3oECBoQAA..i&w=442&h=401&hcb=2&ved=2ahUKEwjWk_X4gpiJAxUiWkEAHU3SJSYQM3oECBoQAA', 
              'Graph showing a reaction reaching chemical equilibrium.'
            ),
            SizedBox(height: 30),

            // Section for Key Concepts
            _buildSectionTitle('Key Concepts of Chemical Equilibrium'),
            SizedBox(height: 16),
            _buildTextContent(
              '1. Dynamic Nature: Even though concentrations remain constant at equilibrium, both forward and reverse reactions continue to occur at the same rate.\n\n'
              '2. Le Chatelier\'s Principle: When a change is applied to a system in equilibrium, the system adjusts to minimize that change. For example, increasing the concentration of reactants will shift the equilibrium towards more products.\n\n'
              '3. Reaction Quotient (Q) and Equilibrium Constant (K): The relationship between reactants and products at any time can be expressed with Q, and at equilibrium with K.'
            ),
            SizedBox(height: 20),

            // Le Chatelier's Principle image
            _buildImageCard(
              'https://chem.libretexts.org/@api/deki/files/126258/lechatliers_principle.png', 
              'Diagram illustrating Le Chatelier\'s Principle'
            ),
            SizedBox(height: 30),

            // Section for an example reaction
            _buildSectionTitle('Example: The Haber Process'),
            SizedBox(height: 16),
            _buildTextContent(
              'The Haber Process is an important industrial method to synthesize ammonia from nitrogen and hydrogen gases:\n\n'
              'N₂(g) + 3H₂(g) ⇌ 2NH₃(g)\n\n'
              'At equilibrium, this reaction is influenced by pressure, temperature, and reactant concentration. Increasing pressure, for instance, pushes the reaction towards ammonia production, as fewer gas molecules are present in the product side.'
            ),
            SizedBox(height: 20),

            // Haber Process diagram
            _buildImageCard(
              'https://www.economicshelp.org/wp-content/uploads/2013/07/haber-process.jpg', 
              'Diagram of the Haber Process reaction'
            ),

            SizedBox(height: 40),
            // A button that could lead to further learning
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
                 onPressed: () {
                    _launchURL('https://www.chemguide.co.uk/physical/equilibria/lechatelier.html'); // Link to more resources
                  },
                child: Text(
                  'Learn More',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create styled section titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.teal[800], // Modern color for section title
      ),
    );
  }

  // Helper method to create styled text content
  Widget _buildTextContent(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 16,
        height: 1.5, // Line height for readability
        color: Colors.grey[800],
      ),
    );
  }

  // Helper method to build image cards with a description
  Widget _buildImageCard(String imageUrl, String description) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12), // Rounded image corners
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                color: Colors.grey[200], // Fallback if the image doesn't load
                child: Center(child: Text('Image not available')),
              );
            },
          ),
        ),
        SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Colors.grey[600], // Muted description color
          ),
        ),
      ],
    );
  }
}
