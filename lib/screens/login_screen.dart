import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
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

  _header(context) {
    return Column(
  
      children: [
        /*Image.asset(
        'assets/images/serre8.PNG',
        width: 350, 
        height: 350, 
        alignment: Alignment.topCenter,
      ), */
      

 /*  ClipRRect(
  borderRadius: BorderRadius.circular(20), // Image border
  child: SizedBox.fromSize(
    size: Size.fromRadius(100), // Image radius
   
    child: Image.network('assets/images/serre8.PNG', fit: BoxFit.cover),
    ),
    ),*/

  //first pic
  Container(
  width: 650,
  height: 200,
  //alignment: Alignment.topCenter,
  margin:EdgeInsets.all(10),
  clipBehavior: Clip.antiAlias,
  decoration:  BoxDecoration(
    borderRadius: BorderRadius.circular(70) // Adjust the radius as needed
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
            TextSpan(text: 'Smart', style: TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: GoogleFonts.poppins().fontFamily)),
            TextSpan(text: 'Greenhouse', style: TextStyle(color: Colors.green[700], fontWeight:FontWeight.bold, fontSize: 20, fontFamily: GoogleFonts.poppins().fontFamily)),
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
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.poppins().fontFamily),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 270,
          child: TextField(
            
            decoration: InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(
                fontFamily:GoogleFonts.poppins().fontFamily, 
              ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none),
                //fillColor: Theme.of(context).primaryColor.withOpacity(0.1), //old color?
                fillColor: Colors.blueGrey[50],
                filled: true,
                suffixIcon: Icon(Icons.person,
                color: Colors.green[700],)
                ),     
          ),
        ),

        SizedBox(height: 10),
        Container(
          width: 270,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(
                fontFamily:GoogleFonts.poppins().fontFamily, 
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              //fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              fillColor: Colors.blueGrey[50],
              filled: true,
              suffixIcon: Icon(Icons.lock,
              color: Colors.green[700],),
            ),
            obscureText: true,
          ),
        ),
        
        //login button
        SizedBox(height: 10),
        Container(
          width: 270,
          child: ElevatedButton(
            onPressed: () {},
            
            child: Text(
              "Log in",
              style: TextStyle(fontSize: 20,
              color:Colors.white,fontFamily: GoogleFonts.poppins().fontFamily
              ),
              ),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(vertical: 18,horizontal: 10),
              backgroundColor: Colors.green[600],
            ),
          ),
          
        )
        
      ],
    );  
  }

  _forgotPassword(context) {
    return TextButton(onPressed: () {},
     child:
      Text("Forgot password?",
      style: TextStyle(
              color:Colors.green[900], fontWeight:FontWeight.bold, fontFamily: GoogleFonts.poppins().fontFamily
              ),
              )
              );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ",
        style:TextStyle(
          color: Colors.grey,fontFamily: GoogleFonts.poppins().fontFamily
          ),
          ),
        TextButton(onPressed: () {},
         child: Text("Sign Up",
         style: TextStyle(
          color: Colors.green[900], fontWeight:FontWeight.bold, fontFamily: GoogleFonts.poppins().fontFamily
         ),
         )
         )
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
    )
  );
}

