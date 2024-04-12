import 'package:app/constants.dart';
import 'package:app/screens/home/components/body.dart';
import 'package:app/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'components/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      drawer: NavigationDrawer(),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.green[700],
      elevation: 0,
      /*leading: IconButton(
        color: Colors.white,
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),*/
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Container(
    color: Colors.green[700],
        padding: EdgeInsets.only(
          top: 24+ MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(
          children: const[
            CircleAvatar(
              radius: 52,
              backgroundImage: AssetImage("assets/images/farmer.png"),
            ),
            SizedBox(height: 12,),
            Text(
              "Nour Badreddine",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Text(
              "nourbadreddine999@gmail.com",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16, //espace verticale
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text("Favoris"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.workspaces_outline),
              title: const Text("Workflow"), //change 
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text("Settings"),//change to settings
              onTap: () {
                //close navigation drawer avant
                Navigator.pop(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
              },
            ),
            const Divider(
              color: Colors.black54,
            ),
            ListTile(
              leading: const Icon(Icons.account_tree_outlined),
              title: const Text("Plugins"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text("Notifications"),
              onTap: () {},
            ),
          ],
        ),
      );
}
