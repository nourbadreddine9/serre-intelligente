import 'package:app/controllers/profile_controller.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  bool switchAuto = false;
  bool switchMan = true;

  final ProfileController profileController = ProfileController();

  onChangeAuto(bool newValue1) {
    setState(() {
      switchAuto = newValue1;
      if (newValue1) {
        switchMan = false;
      }
    });
  }

  onChangeMan(bool newValue2) {
    setState(() {
      switchMan = newValue2;
      if (newValue2) {
        switchAuto = false;
      }
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text(
          "Settings",
          style: TextStyle(
              fontSize: 22, fontFamily: GoogleFonts.inter().fontFamily),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.green[700],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                )
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOption(context, "Change Password"),
            buildAccountOption(context, "Content Settings"),
            buildAccountOption(context, "Social"),
            buildAccountOption(context, "Language"),
            buildAccountOption(context, "Privacy and Security"),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(Icons.volume_up_outlined, color: Colors.green[700]),
                SizedBox(width: 10),
                Text("Mode",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    )),
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildNotificationOption(
                "Mode automatique", switchAuto, onChangeAuto),
            buildNotificationOption("Mode manuel", switchMan, onChangeMan),
            buildNotificationOption(
                "Opportunity", valNotify3, onChangeFunction3),
            SizedBox(height: 50),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirmation'),
                        content:
                            Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text('Annuler'),
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Fermer le AlertDialog
                            },
                          ),
                          ElevatedButton(
                            child: Text('Déconnexion'),
                            onPressed: () {
                              profileController
                                  .signOut(context)
                                  .then((_) {})
                                  .catchError((error) {
                                // Gérer l'erreur si nécessaire
                              });
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  "SIGN OUT",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      letterSpacing: 2.2,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildNotificationOption(
      String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.inter().fontFamily,
                color: Colors.grey[600],
              )),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.green[700],
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text("Option 1"), Text("Option 2")],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"))
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.inter().fontFamily,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
