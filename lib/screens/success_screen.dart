import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatefulWidget {
  SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(24),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 40,
                width: 50,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Smart",
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Color(0xFF98C13F),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "Greenhouse",
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Color(0xFF159148),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 90,
              ),
              _success(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _success(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 10),

        Image.asset(
          'assets/images/success.gif', // Chemin de l'image du logo
          height: 50, // Ajustez la hauteur du logo selon vos besoins
          width: 70, // Ajustez la largeur du logo selon vos besoins
        ),

        // SizedBox(height: 10),

        Text(
          'verified !',
          style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Pour aligner le texte en haut
          children: [
            Expanded(
              // Pour que le texte puisse occuper l'espace restant
              child: Text(
                "Votre compte a été créé avec succès",
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.grey,
                    fontSize: 12),
                textAlign: TextAlign.center, // Alignement du texte à gauche
                softWrap: true, // Permettre le retour à la ligne automatique
              ),
            ),
          ],
        ),

        SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Allez à la page d'accueil",
            style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: GoogleFonts.poppins().fontFamily,),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Color(0xFF159148),
            backgroundColor: Color(0xFF159148),
            elevation: 0,
            /* shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),*/
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }
}