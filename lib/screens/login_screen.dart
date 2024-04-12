import 'package:app/controllers/profile_controller.dart';
import 'package:app/screens/edit_profile_screen.dart';
import 'package:app/screens/forgot_password_screen.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:app/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? passwordVisible;
  //
  TextEditingController? emailController; 
  TextEditingController? passwordController;
ProfileController profileController=ProfileController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          //margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _forgotPassword(context),
              _signup(context),
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
  emailController = TextEditingController();
  passwordController = TextEditingController(); 
}
@override
  void dispose() {
    emailController?.dispose(); // Nettoyage
    passwordController?.dispose(); 
    super.dispose();
  }

  _header(context) {
    return Column(
      children: [
        //first pic
        Container(
          width: 650,
          height: 200,
          //alignment: Alignment.topCenter,
          margin: EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(70) // Adjust the radius as needed
              ),
          child: Image.network(
            'assets/images/serre8.PNG',
            fit: BoxFit.cover,
          ),
        ),

        //logo
        Image.asset(
          'assets/images/logo.PNG',
          width: 50,
          height: 50,
          alignment: Alignment.topCenter,
        ),

        // smartgreen text
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: 'Smart',
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: GoogleFonts.poppins().fontFamily)),
              TextSpan(
                  text: 'Greenhouse',
                  style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: GoogleFonts.poppins().fontFamily)),
            ],
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Text(
                "Welcome Back!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Text(
                "Log into your account",
                style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
              ),
            )
          ],
        ),
      ],
    );
  }

  _inputField(context) {
    final keyForm =GlobalKey<FormState>();
    return Form(
      key: keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 270,
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "E-mail",
                  hintStyle: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                  //fillColor: Theme.of(context).primaryColor.withOpacity(0.1), //old color?
                  fillColor: Colors.blueGrey[50],
                  filled: true,
                  prefixIcon: Icon(Icons.email, color: Colors.green[700]),
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
          ),
      
          SizedBox(height: 10),
          Container(
            width: 270,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none),
                //fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                fillColor: Colors.blueGrey[50],
                filled: true,
                prefixIcon: Icon(Icons.lock,color: Colors.green[700]),
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
              ),
              obscureText:passwordVisible!,
              validator: (value){
                    if(value!.isEmpty){
                      return "please enter your password";
                    } else if(value.length<8){
                      return "pwd must be >8";
                    }
                    return null;
                  },
                  controller: passwordController,
            ),
          ),
      
          //login button
          SizedBox(height: 10),
          Container(
            width: 270,
            child: ElevatedButton(
              onPressed: () async {
                if (keyForm.currentState!.validate()){
                  print("valid");
                 await profileController.signInWithEmailAndPassword(emailController!.text, passwordController!.text,context);

                }
              },
              child: Text(
                "Log in",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                backgroundColor: Colors.green[600],
              ),
              
            ),
          )
        ],
      ),
    );
  }

  _forgotPassword(context) {
    return Text.rich(
        TextSpan(
          text: "Forgot password?",
          style: TextStyle(
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily
              ),
             recognizer: TapGestureRecognizer() 
            .. onTap=() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen(),));
            } 
            )
        );
  }

  _signup(context) {
    return Text.rich(
      TextSpan(
        text: "Don't have an account? ",
        style: TextStyle(
            color: Colors.grey, fontFamily: GoogleFonts.poppins().fontFamily),
        children: [
          TextSpan(
            text: "Sign Up",
            style: TextStyle(
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            recognizer: TapGestureRecognizer() 
            .. onTap=() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
            }
          )
        ],
      ),
    );

  }
  void _signIn() async{
 
    String email = emailController!.text;
    String password =passwordController!.text;
  
    print("signin");
    User? user = await profileController.signInWithEmailAndPassword(email, password,context);
  
    if(user!=null){
      print("user is succefully signedIn");
      Navigator.pushNamed(context, "/home");

    }else{
      print("some error happend");
    }

  }
}
