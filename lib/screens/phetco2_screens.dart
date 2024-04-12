import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Phetco2Screens extends StatefulWidget {
  const Phetco2Screens({Key? key}) : super(key: key);

  @override
  _Phetco2ScreensState createState() => _Phetco2ScreensState();
}

class _Phetco2ScreensState extends State<Phetco2Screens> {
  bool switchValue1 = false;
  bool switchValue2 = false;
 // double gaz = 0;
  var gaz;
  DatabaseReference _gazRef = FirebaseDatabase.instance.ref('sensors').child('gaz'); // Référence à la valeur de température dans Firebase
   @override
  void initState() {
    super.initState();
    // Écoute les changements de données en temps réel dans Firebase
    _gazRef.onValue.listen((event) {
      // Met à jour la température avec la valeur reçue de Firebase
      setState(() {
       gaz = (event.snapshot.value as double?) ?? 0;
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
                  //  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 102,
                    ),
                    Container(
                      child: SizedBox(
                        // width: 50, // Largeur de la jauge moyenne
                        //  height: 50, // Hauteur de la jauge moyenne
                        child: SfLinearGauge(
                          
                          minorTicksPerInterval: 1,
                          useRangeColorForAxis: true,
                          animateAxis: true,
                          axisTrackStyle: LinearAxisTrackStyle(thickness: 1),
                          maximum: 14, // Définir
                          ranges: <LinearGaugeRange>[
                            LinearGaugeRange(
                                startValue: 0,
                                endValue: 6,
                                position: LinearElementPosition.outside,
                                color: Color(0xffF45656)),
                            LinearGaugeRange(
                                startValue: 6,
                                endValue: 7,
                                position: LinearElementPosition.outside,
                                color: Color(0xffFFC93E)),
                            LinearGaugeRange(
                                startValue: 7,
                                endValue: 14,
                                position: LinearElementPosition.outside,
                                color: Color(0xff0DC9AB)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: Text(
                        'ph scale',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 155,
                    ),
                    Container(
                      child: SizedBox(
                        child: CircularPercentIndicator(
                            radius: 80,
                            lineWidth: 20,
                            percent: 0.4,
                            progressColor: Colors.green.shade900,
                            backgroundColor: Colors.green,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text( '$gaz',    //valeur du firebaseeeeeeeeeeeee
                              style: TextStyle(
                                  fontFamily: 'PoppinsRegular',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Co2 (ppm)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PoppinsRegular',
                          color: Colors.black,
                        ),
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