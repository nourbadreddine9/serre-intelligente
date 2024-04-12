import 'package:app/constants.dart';
import 'package:app/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: Colors.green.shade700.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              color: Colors.green[700],
              onPressed: () {},
              icon: Icon(Icons.home)),
          IconButton(
              color: Colors.green[700],
              onPressed: () {},
              icon: Icon(Icons.energy_savings_leaf_outlined)),
          IconButton(
              color: Colors.green[700],
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
              },
              icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}