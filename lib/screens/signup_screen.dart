import 'dart:js';

import 'package:app/controllers/profile_controller.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';  //pour passer à d'autres pages?
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class SignupScreen extends StatefulWidget {
  @override
  
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
      bool? passwordVisible; 

      //
      final ProfileController profileController =ProfileController();

      //// Déclarations des TextEditingController
      TextEditingController? emailController;
      TextEditingController? usernameController; 
      TextEditingController? passwordController;
      TextEditingController? confirmPasswordController; 

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
             /* ClipRRect(
                borderRadius:
                    BorderRadius.circular(45), // Adjust the radius as needed
                child: Image.network(
                  'assets/images/Rectangle 496.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
              ),*/
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 50, 
                    width: 70, 
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Smart",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 20,
                            color: Color(0xFF98C13F),
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Greenhouse",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 20,
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
              _inputField(context),
              _login(context),
            ],
          ),
        ),
      ),
    );
  }
  
@override
void initState() {
  super.initState();
  passwordVisible=true;
  emailController=TextEditingController();
  usernameController = TextEditingController();
  passwordController = TextEditingController(); 
  confirmPasswordController = TextEditingController();
}
@override
  void dispose() {
    emailController?.dispose();
    usernameController?.dispose(); // Nettoyage
    passwordController?.dispose(); 
    confirmPasswordController?.dispose(); 
    super.dispose();
  }
  Widget _inputField(BuildContext context) {
    final KeyForm = GlobalKey<FormState>();

    return Form(
      key: KeyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
              decoration: InputDecoration(
                //hintText: "Nom/Prénom",
                labelText: "Nom/Prénom",
                labelStyle: TextStyle(color: Colors.grey,fontFamily: GoogleFonts.poppins().fontFamily,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xFF159148),
                ),
                suffixIconConstraints: BoxConstraints(minWidth: 40),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "please entrez nom";
                }
              },
              controller: usernameController, 
              ),
          SizedBox(height: 10),
          TextFormField(
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(color: Colors.grey,fontFamily: GoogleFonts.poppins().fontFamily,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: Icon(Icons.email, color: Color(0xFF159148)),
                suffixIconConstraints: BoxConstraints(minWidth: 40),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "please entrez email";
                }
                //not true) false
                else if (!EmailValidator.validate(value!)) {
                  return "enter valid email";
                }
                return null;
              },
              controller: emailController,
              ),
          SizedBox(height: 10),
          TextFormField(
              decoration: InputDecoration(
                // hintText: " mot de passe",
                labelText: "mot de passe",
                labelStyle: TextStyle(color: Colors.grey,fontFamily: GoogleFonts.poppins().fontFamily,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                //suffixIcon: Icon(Icons.lock, color: Color(0xFF159148)),
                //zidhom prefix lkol al gauche w suffix lmdp
                prefixIcon: Icon(Icons.lock,color: Color(0xFF159148)),
                suffixIcon: IconButton(
                  color: Color(0xFF159148),
                  onPressed: (){
                    setState( 
                          () { 
                            passwordVisible = !passwordVisible!; 
                          }, 
                        );
                  },
                  icon: Icon(
                    passwordVisible! 
                          ? Icons.visibility 
                          : Icons.visibility_off
                  ),
                ),
                suffixIconConstraints: BoxConstraints(minWidth: 40),
              ),
               obscureText:passwordVisible!,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please entrez mot de passe";
                } else if (value.length < 8) {
                  return "mot de passe must be >8";
                }
              },
              controller: passwordController,
              ),
          SizedBox(height: 10),
          TextFormField(
              decoration: InputDecoration(
                // hintText: "Confirmez le mot de passe",
                labelText: "Confirmez votre mot de passe",
                labelStyle: TextStyle(color: Colors.grey,fontFamily: GoogleFonts.poppins().fontFamily,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: Icon(Icons.lock, color: Color(0xFF159148)),
                suffixIconConstraints: BoxConstraints(minWidth: 40),
              ),
              // obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please entrez mot de passe";
                }
              },
              controller: confirmPasswordController,
              ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Pour aligner le texte en haut
            children: [
              Container(
                color: Colors.white,
                child: Checkbox(
                  value: false,
                  checkColor:
                      Color(0xFF159148), // Case à cocher non cochée par défaut
                  onChanged: (newValue) {},
                ),
              ),
              Expanded(
                // Pour que le texte puisse occuper l'espace restant
                child: Text(
                  "By signing up you agree to our terms & CONDITIONS of use and privacy policy.",
                  style: TextStyle(color: Colors.grey, fontSize: 12,fontFamily: GoogleFonts.poppins().fontFamily,),
                  textAlign: TextAlign.left, // Alignement du texte à gauche
                  softWrap: true, // Permettre le retour à la ligne automatique
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          //keep gesture detector??
          ElevatedButton(
            onPressed: () {
              //pour tester ce que retourne controller
              print("controller=>>>$emailController");
              print("controller=>>>${emailController!.text}");
              if (KeyForm.currentState!.validate()) {
                print("valid");
                profileController.signUpWithEmailAndPassword(emailController!.text, passwordController!.text,context);
              }
            
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,),
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

  _login(context) {
    return Text.rich(TextSpan(
      text: "Vous avez déjà un compte ? ",
      style: TextStyle(
        color: Colors.grey,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      children: [
        TextSpan(
            text: "login",
            style: TextStyle(
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              })
      ],
    ));
  }

 
}
