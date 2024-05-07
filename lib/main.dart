import 'package:app/image_plant_screen.dart';
import 'package:app/screens/actionneurs_screen.dart';
import 'package:app/screens/forgot_password_screen.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/importImage.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:app/screens/temperature_screen.dart';
import 'package:app/screens/test.dart';
import 'package:app/screens/analyse_image_screen.dart';
import 'package:app/screens/welcome_screen.dart';
import 'package:app/screens/settings_screen.dart';
import 'package:app/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
 //firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => print("succes")).onError((error, stackTrace) => print("error:$error"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ImportImage(), //change it to wlc screen
    );
  }
}

