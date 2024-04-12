/*import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';
class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vertical Percent Indicator'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const VerticalBarIndicator(
              percent: 0.9,
              header: '90%',
              footer: '2019',
            ),
            const VerticalBarIndicator(
              percent: 0.5,
              header: '50%',
              height: 200,
              width: 30,
              color: [
                Colors.indigo,
                Colors.teal,
              ],
              footer: 'Task\ncompleted',
            ),
            VerticalBarIndicator(
              percent: 1,
              header: 'Speed',
              color: [
                Colors.blue.withOpacity(0.5),
                Colors.blue,
              ],
              circularRadius: 0,
            ),
            const VerticalBarIndicator(
              percent: 0.95,
              height: 250,
              animationDuration: Duration(seconds: 1),
              circularRadius: 0,
              color: [
                Colors.limeAccent,
                Colors.green,
              ],
              width: 50,
              header: '95%',
              footer: 'Lumière',
            ),
          ],
        ),
      ),
    );
  }
}*/