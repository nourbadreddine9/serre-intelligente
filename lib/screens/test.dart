import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String? name;
  @override
  void initState() {
    name = "ahlem";
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text("bnj $name"),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name="nour";
                  print("name>>>>$name");
                });
              },
             child:Text("click") )
          ],
        ),
      ),
    );
  }
}
