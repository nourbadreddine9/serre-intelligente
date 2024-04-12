import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => null;

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('userCredential===============> $credential');
      if (credential.user != null) {
        print("user is succefully created");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print("some error occured $e");
    }
    return null;
  }

  UserCredential? credential;
  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      print("++++++++++++++++++++++++++signin");
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        credential = value;
        print("++++++++++++++++++++++++++IF");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }).onError((error, stackTrace) {
            print("++++++++++++++++++++++++++ELSE");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green[200],
        content: Text('verify your email or password'),
      ));
      });
  
      print("email============>${credential!.user!.email}");

      return credential!.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print("some error occured $e");
      //  ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Colors.green[200],
      //       content: Text('verify your email or password',style: TextStyle(color: Colors.white),),
      //     ),
      //   );
    }
    return null;
  }

  //signOut() {}
  Future<void> signOut(BuildContext context) async {
  try {
    await _auth.signOut();
    // redirect to wlc screen
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  } catch (e) {
    print("Erreur lors de la déconnexion: $e");
  }
}
}
