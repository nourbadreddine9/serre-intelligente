import 'dart:io';

import 'package:app/constants.dart';
import 'package:app/screens/actionneurs_screen.dart';
import 'package:app/screens/home/components/recommand_plant_card.dart';
import 'package:app/screens/temperature_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RecommendedSerres extends StatefulWidget {
  const RecommendedSerres({ Key? key }) : super(key: key);

  @override
  _RecommendedSerresState createState() => _RecommendedSerresState();
}

class _RecommendedSerresState extends State<RecommendedSerres> {
  @override
  Widget build(BuildContext context) {
    /* File img =File("");
     bool isValid=false;
    Future<void> getLostData() async {
  final ImagePicker picker = ImagePicker();
  
// Pick an image.
final XFile? image = await picker.pickImage(source: ImageSource.gallery);
 img=File(image!.path);
 //if(img != null){
  setState(() {
      isValid=true;

  });
 //}
print('image=============================${img}');
  final LostDataResponse response = await picker.retrieveLostData();
  if (response.isEmpty) {
    return;
  }
  final List<XFile>? files = response.files;
  if (files != null) {
   // _handleLostFiles(files);
  } else {
  //  _handleError(response.exception);
  }
}*/
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecommendPlantCard(
            image: "assets/images/serre1.jpg",
            title: "Serre 1",
            country: "Monastir",
            press: (){
            //  print("on tap888");
            //  print('seeeeeeee');
              //  getLostData();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyGreenHouse(),));              

            },
          ),
          RecommendPlantCard(
            image: "assets/images/serre1.jpg",
            title: "Serre 2",
            country: "Monastir",
            press: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyGreenHouse(),));   
            },
          
          ),
          RecommendPlantCard(
            image: "assets/images/serre1.jpg",
            title: "Serre 3",
            country: "Monastir",
            press: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyGreenHouse(),));   
            },
          ),
     // Image.file(img)
     ]
      ),
    );
  }


}

