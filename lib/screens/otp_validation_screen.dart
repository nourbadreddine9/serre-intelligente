import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:app/screens/success_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpValidation extends StatefulWidget {
  const OtpValidation({Key? key}) : super(key: key);


  @override
  _OtpValidationState createState() => _OtpValidationState();
}

class _OtpValidationState extends State<OtpValidation> {
  

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png', // Chemin de l'image du logo
                    height: 50, // Ajustez la hauteur du logo selon vos besoins
                    width: 70, // Ajustez la largeur du logo selon vos besoins
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Smart",
                          style: TextStyle(
                            fontFamily:  GoogleFonts.poppins().fontFamily,
                            color: Color(0xFF98C13F),
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Greenhouse",
                          style: TextStyle(
                            fontFamily:  GoogleFonts.poppins().fontFamily,
                            color: Color(0xFF159148),
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'OTP verification',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  "Entrez le code de vérification que nous venons d'envoyer sur votre adresse e-mail. ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ),
              //SizedBox(height: 40,),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                keyboardType: TextInputType.number,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.green),
                  ),
                ),
                 onChanged: (value) {
                  
                 
               },
                onCompleted: (pin) => debugPrint(pin),
              ),
              SizedBox(
                height: 20,
              ), 
              ElevatedButton(
                onPressed: () {
                  // Ajoutez ici le code que vous souhaitez exécuter lorsque le bouton est pressé
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuccessScreen()),
                  );
                },
                child: Text('Vérification',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.white,
                    )),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF159148),
                  backgroundColor: Color(0xFF159148),
                  elevation: 100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 36, horizontal: 36),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              _forgotYourPassword(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _forgotYourPassword(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Vous n'avez pas reçu le code ? ",
        style: TextStyle(
          color: Colors.black,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
      TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 2, 37, 17),
          elevation: 100,
        ),
        child: Text(
          "Renvoyer",
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Color(0xFF159148),
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );
}