import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
        
          Image.asset(
            'assets/images/serrebg.jpeg',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
               Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Smart",
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.green[1000],
                        decoration: TextDecoration.none,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "Greenhouse",
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.green[1000],
                        decoration: TextDecoration.none,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 90,),
              ElevatedButton(
                onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  ); },
                  
                  
                child: Text(
                  'Get started',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, 
                  foregroundColor: Colors.black, 
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18), 
                    side: BorderSide(
                        color: Colors.black,
                        width: 1), 
                  ), 
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}