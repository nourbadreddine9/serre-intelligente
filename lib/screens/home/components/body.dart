import 'package:app/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'featured_serres.dart';
import 'header_part.dart';
import 'title_with_more_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'recommended_serres.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    //will provide total height and width of screen
    Size size = MediaQuery.of(context).size;
    //enables scrolling on small devices
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderPart(size: size),
          TitleWithMoreBtn(
            title: "Serres",
            press: () {


            },
          ),
          RecommendedSerres(),
          TitleWithMoreBtn(
            title: "Autres",
            press: () {},
          ),
          FeaturedSerres(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}

