import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class HeaderPart extends StatelessWidget {
  const HeaderPart({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: EdgeInsets.only(bottom: kDefaultPadding*2.5),
      //will cover 20% of our total height
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 +kDefaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "Nos Serres!",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                  ),
                Spacer(),
                Image.asset("assets/images/logo.png")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
