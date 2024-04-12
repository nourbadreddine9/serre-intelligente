import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
 HomePage({ Key? key }) : super(key: key);

Future<void> signOut() async{
  //await FirebaseAuthService().signOut();
}

Widget _title(){
  return const Text("FirebasAuth");
}

Widget _userUid(){
  return Text("user?.email ??" "User email");
}

Widget _signOutButton(){
  return ElevatedButton(
    onPressed: signOut,
    child: const Text("Sign out"),
    );
}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userUid(),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}