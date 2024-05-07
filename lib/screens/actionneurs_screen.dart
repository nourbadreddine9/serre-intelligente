import 'package:app/core/theme/app_colors.dart';
import 'package:app/screens/lumiereethum_screen.dart';
import 'package:app/screens/phetco2_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:app/screens/temperature_screen.dart';


class MyGreenHouse extends StatefulWidget {
  const MyGreenHouse({Key? key}) : super(key: key);

  @override
  _MyGreenHouse createState() => _MyGreenHouse();
}

class _MyGreenHouse extends State<MyGreenHouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9E3CC),
      appBar: AppBar(leading: IconButton(icon:
                     Icon(
                      Icons.arrow_back_sharp,
                      size: 28,
                      color: AppColors.backgroundColor,
                    ),
                    onPressed: () => Navigator.pop(context),
                    
                    ),),
      body: SafeArea(
        child: Container(
         // margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                     const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'Serre 1',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/serre1.jpg',height: 150,width: 280,
                       scale: 1.1,
                      ),
                    ),
                   
                  
                     const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _cardMenu(
                            onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TemperatureScreen(),
                              ),
                            );
                          },
                            title: 'Humidité',
                            icon: 'assets/images/hum.jpeg',
                          ),
                          _cardMenu(
                             onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TemperatureScreen(),
                              ),
                            );
                          },
                            title: 'Température',
                            icon: 'assets/images/température.jpeg',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _cardMenu(
                            onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LumiereethumScreen(),
                              ),
                            );
                          },
                            title: 'Humidité du sol',
                            icon: 'assets/images/humsol1.jpeg',
                          ),
                          _cardMenu(
                            onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LumiereethumScreen(),
                              ),
                            );
                          },
                            title: 'lumière',
                            icon: 'assets/images/lumière.jpg',
                          ),
                        ],
                      ),
                    ),
                     const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _cardMenu(
                            onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Phetco2Screens(),
                              ),
                            );
                          },
                            title: 'PH',
                            icon: 'assets/images/ph.png',
                          ),
                          _cardMenu(
                            onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Phetco2Screens(),
                              ),
                            );
                          },
                            title: 'Co2',
                            icon: 'assets/images/co2.png',
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

  Widget _cardMenu({
    required String title,
    required String icon,
    VoidCallback? onTap,
    Color color = Colors.white,
    Color fontcolor = Colors.green,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
       // padding: const EdgeInsets.symmetric(vertical: 35),
        width:156,
        //height: 50,
       
        decoration: BoxDecoration(
           color: color,
          //borderRadius: BorderRadius.circular(24),
         
        ),
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.start,

          children: [
              
            Image.asset(icon,height: 85,width: 85,),
            //SizedBox(  height: 20,width: 20, ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: fontcolor,),
          )
          ],
        ),
      ),
    );
  }
}


/*void main() {
  runApp(ListesDonnEs());
}*/