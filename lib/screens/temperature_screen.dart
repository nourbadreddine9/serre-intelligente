import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:firebase_database/firebase_database.dart';



class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({Key? key}) : super(key: key);

  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  double temperature = 0; // initialiser la température à 0
  double hum=0;
   

  DatabaseReference _temperatureRef = FirebaseDatabase.instance.ref('sensors').child('temperature'); // Référence à la valeur de température dans Firebase
   DatabaseReference _humRef = FirebaseDatabase.instance.ref('sensors').child('hum'); 


     DatabaseReference _servoRef = FirebaseDatabase.instance.ref().child('servoPosition'); //newwwwwwwwwwww


  bool switchValue1 = false;
  bool switchValue2 = false;

   @override              //newwwwwwfirebase
  void initState() {
    super.initState();
    // permet  les changements de données en temps réel dans Firebase
    _temperatureRef.onValue.listen((event) {
             print('temp=event==============================================$temperature');

      // Met à jour la température avec la valeur reçue de Firebase
      setState(() {
      temperature = (event.snapshot.value as double?) ?? 0;////convertir valeur  d'autre façon 
                         
       print('temp===============================================$temperature');
      });
    });
     _humRef.onValue.listen((event) {
    
      setState(() {
       hum= (event.snapshot.value as double?) ?? 0;
      });
    });
      _servoRef.onValue.listen((event) { //changer les  données en temps réel 
      setState(() {
        switchValue2 = (event.snapshot.value ?? false) as bool;
      });
    });
  }

   void _updateServoPosition(bool value) { // met à jour la position du servomoteur 
    _servoRef.set(value);
    
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
                                NeedlePointer(value: temperature,)//valeur de température en temps réel firebaseeeeeeeeee
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Container(


                                   child: Text('$temperature',//pour mettre à jour variable de température
                                        style: TextStyle(
                                            fontSize:15,fontFamily: 'PoppinsRegular',
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
                        'temperature',
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
                                NeedlePointer(value: hum,)
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Container(
                                    child: Text('$hum',
                                        style: TextStyle(
                                            fontSize: 15,fontFamily: 'PoppinsRegular',
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
                        'Humidité',
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
                            title: 'ventilateur',
                            icon: 'assets/images/fan2.png',
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
                            icon: 'assets/images/window.jpg',
                            title: 'fenetre',
                            switchValue: switchValue2,
                            onSwitchChanged: _updateServoPosition, //quand je clique sur le boutonl'etat duservomoteur change.
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
 // bool switchValue = false,
 required bool  switchValue ,//newwwwwwwwwwww
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