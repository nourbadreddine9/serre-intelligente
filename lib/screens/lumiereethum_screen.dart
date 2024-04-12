import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LumiereethumScreen extends StatefulWidget {
  const LumiereethumScreen({ Key? key }) : super(key: key);

  @override
  _LumiereethumScreenState createState() => _LumiereethumScreenState();
}

class _LumiereethumScreenState extends State<LumiereethumScreen> {
  
  bool switchValue1 = false;
  bool switchValue2 = false;
  
  //double light=0;
  var light;
  var moistureValue;
  DatabaseReference _lightRef = FirebaseDatabase.instance.ref('sensors').child('light'); // Référence à la valeur de température dans Firebase
    DatabaseReference _moistureValueRef = FirebaseDatabase.instance.ref('sensors').child('moistureValue'); // Référence à la valeur de température dans Firebase

   @override              //newwwwwwfirebase
  void initState() {
    super.initState();
    // Écoute les changements de données en temps réel dans Firebase
    _lightRef.onValue.listen((event) {
      // Met à jour la température avec la valeur reçue de Firebase
      setState(() {
       light = (event.snapshot.value as double?) ?? 0;
      });
    });
     _moistureValueRef.onValue.listen((event) {
      // Met à jour la température avec la valeur reçue de Firebase
      setState(() {
       moistureValue = (event.snapshot.value as double?) ?? 0;
      });
    });
     
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9E3CC),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                   SizedBox(
                     height: 32,
                   ),
                    Container(
                      child: SizedBox(
                        width: 150, // Largeur de la jauge moyenne
                        height: 150, // Hauteur de la jauge moyenne
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 55,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 30,
                                    color: Colors.green),
                                GaugeRange(
                                    startValue: 30,
                                    endValue: 40,
                                    color: Colors.orange),
                                GaugeRange(
                                    startValue: 40,
                                    endValue: 55,
                                    color: Colors.red),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(value: light,)//valeur de lumiere en temps réel firebaseeeeeeeeee
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Container(
                                    child: Text('$light',
                                        style: TextStyle(
                                            fontSize:10,fontFamily: 'PoppinsRegular',
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  angle: 90,
                                  positionFactor: 0.6,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    //SizedBox(
                    // height: 32,
                    // ),
                    Center(
                      child: Text(
                        'lumière',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,fontFamily: 'PoppinsRegular',
                         
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: SizedBox(
                        width: 150, // Largeur de la jauge moyenne 200
                        height: 150, // Hauteur de la jauge moyenne 200
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 85,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 60,
                                    color: Colors.green),
                                GaugeRange(
                                    startValue: 60,
                                    endValue: 70,
                                    color: Colors.orange),
                                GaugeRange(
                                    startValue: 70,
                                    endValue: 85,
                                    color: Colors.red),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(value: moistureValue), ///l'aiguille se positionne avec la valeur  du dol
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Container(
                                    child: Text('$moistureValue',   //valeur dol du firebase
                                        style: TextStyle(
                                            fontSize: 10,fontFamily: 'PoppinsRegular',
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  angle: 90,
                                  positionFactor: 0.6,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Humidité du sol',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                         fontFamily: 'PoppinsRegular',
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(height: 42),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _cardMenu(
                            title: 'vanne',
                            icon: 'assets/images/pump.png',
                            switchValue:
                                switchValue1, // L'état actuel du bouton Switch 1
                            onSwitchChanged: (value) {
                              // La fonction pour gérer les changements d'état du bouton Switch 1
                              setState(() {
                                switchValue1 = value;
                              });
                            },
                          ),
                          SizedBox(height: 16),
                          _cardMenu(
                            icon: 'assets/images/light.png',
                            title: 'lumière',
                            switchValue: switchValue2,
                            onSwitchChanged: (value) {
                              setState(() {
                                switchValue2 = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _cardMenu({
  required String title,
  required String icon,
  VoidCallback? onTap,
  bool switchValue = false,
  ValueChanged<bool>? onSwitchChanged,
  Color color = Colors.white,
  Color fontColor = Colors.green,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(icon, height: 45),
              SizedBox(width: 12), // Espacement entre l'image et le titre
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsRegular',
                  color: fontColor,
                ),
              ),
            ],
          ),
          Switch(
            value: switchValue,
            onChanged: onSwitchChanged,
            activeColor: Colors.green, // Couleur de l'interrupteur activé
          ),
        ],
      ),
    ),
  );
}