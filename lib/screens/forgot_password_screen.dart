import 'package:app/screens/signup_screen.dart';
import 'package:app/screens/otp_validation_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';


class ForgotPasswordScreen extends StatelessWidget {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(45), // Adjust the radius as needed
                child: Image.network(
                  'assets/images/serre11.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png', // Chemin de l'image du logo
                    height: 50,
                    width: 70, 
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
                  SizedBox(height: 30,),
                ],
              ),
             
              _inputField(context),
              
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(BuildContext context) {
    final  KeyForm = GlobalKey<FormState>();
    return Form(
       key: KeyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children: [
           Align(
          alignment: Alignment.center, // Alignement au centre
          child: Text(
            "Mot de passe oublié",
            style: TextStyle(
               fontFamily:  GoogleFonts.poppins().fontFamily,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              
              labelText: "Entrez votre E-mail",
              labelStyle: TextStyle( fontFamily:  GoogleFonts.poppins().fontFamily,color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              suffixIcon: Icon(Icons.email, color: Color(0xFF159148)),
              suffixIconConstraints: BoxConstraints(minWidth: 40),
            ),
             validator:(value){
              if (value!.isEmpty){
                return "please entrez email";
              }
              else if (!EmailValidator.validate(value!)){
                return "entrez email valid";
              }
              else {
                return null;
              }}
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
               if (KeyForm.currentState!.validate()){
                print("valid");
                Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpValidation ()),
        );
              }
             
            },
            child: Text(
              "continue",
              style: TextStyle( fontFamily:  GoogleFonts.poppins().fontFamily,fontSize: 20, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Color(0xFF159148),
              backgroundColor: Color(0xFF159148),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ),
    );
  }

  _signup(context) {
    return  Text.rich(
      TextSpan(
        text: "Vous n’avez pas de compte ? ",
        style: TextStyle(
            color: Colors.grey, fontFamily:  GoogleFonts.poppins().fontFamily,),
        children: [
          TextSpan(
            text: "Sign up",
            style: TextStyle(
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
               decoration: TextDecoration.underline,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            recognizer: TapGestureRecognizer()
            .. onTap=() {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupScreen(),));
            }
          )
        ],
      ));                                           
    
   
  }
}