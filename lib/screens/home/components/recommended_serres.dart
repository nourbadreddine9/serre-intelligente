import 'package:app/constants.dart';
import 'package:app/screens/actionneurs_screen.dart';
import 'package:flutter/material.dart';

class RecommendedSerres extends StatelessWidget {
  const RecommendedSerres({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecommendPlantCard(
            image: "assets/images/serre1.jpg",
            title: "Serre 1",
            country: "Monastir",
            press: (){
                                    
            },
          ),
          RecommendPlantCard(
            image: "assets/images/serre1.jpg",
            title: "Serre 2",
            country: "Monastir",
            press: (){
              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyGreenHouse(),
                              ),
                            );
            },
            
          ),
          RecommendPlantCard(
            image: "assets/images/serre1.jpg",
            title: "Serre 3",
            country: "Monastir",
            press: (){},
          ),
        ],
      ),
    );
  }
}

class RecommendPlantCard extends StatelessWidget {
  const RecommendPlantCard({
    super.key,
    required this.image,
    required this.title,
    required this.country,
    required this.press,
  });
  final String image, title, country;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: [
          Image.asset(image),
          GestureDetector(
            onTap: press(),
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.green.shade700.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: Colors.green.shade700.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
