import 'dart:typed_data';

import 'package:flutter/material.dart';
class AnalyseImageScreen extends StatelessWidget {
  final String?  nameMaladie;
  final  Uint8List? image;
   AnalyseImageScreen({Key? key, this.nameMaladie, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image principale en arrière-plan
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/serre1.jpg",
              height: 990,
              width: 0,
              fit: BoxFit.cover,
            ),
          ),
          // Conteneur pour le cadre
          Positioned(
            bottom: 150, // Position verticale du cadre
            // left: 20,
            // right: 20,
            child: Container(
              height: 250, // Hauteur agrandie du cadre
              color: Colors.black.withOpacity(0.5), // Couleur du cadre (noir semi-transparent)
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Ajustez le padding
              child: Row(
                children: [
                  // Petite image à gauche
                 
Image.memory(image!),

                  SizedBox(width: 30), // Espacement entre l'image et le titre
                  // Titre et texte
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Titre centré en gras
                      SizedBox(
                        width: 10, // Ajustez la largeur de l'espacement
                      ),
                      Text(
                        "Titre",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24, // Ajustez la taille de la police
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5), // Espacement entre le titre et le texte
                      // Texte
                      Text(
                        "$nameMaladie",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, // Ajustez la taille de la police
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}