// import 'dart:ui';

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pudu_sensor/widgets/sensor_info_widget.dart';

void main() {
  runApp(MyApp());
}

class Counter extends ChangeNotifier {
  var _count = 0;
  int get getCounter {
    return _count;
  }

  void incrementCounter() {
    _count++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  int _counter = 0;
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);
  void _incrementCounter() {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  var sensorInfoWidget = SensorInfoWidget;
  @override
  Widget build(BuildContext context) {
    final sensorNames = [
      "Vision",
      "Imaging",
      "Temperature",
      "Radiation",
      "Proximity",
      "Pressure",
      "Position",
      "Photoelectric",
      "Particle",
      "Motion",
      "Metal",
      "Level",
      "Leak",
      "Humidity",
      "Gas",
      "Chemical",
      "Force",
      "Flow",
      "Flaw",
      "Flame",
      "Electrical",
      "Contact",
      "Non-Contact"
    ];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("widget---title"),
      ),
      // body: Container(
      //   width: width,
      //   height: height,
      //   child: ListView.builder(
      //     itemCount: sensorNames.length,
      //     itemBuilder: (context, index) {
      //       return Padding(
      //         padding: EdgeInsets.all(4),
      //         child: SensorInfoWidget(
      //           context,
      //           width: width,
      //           sensor_name: sensorNames[index],
      //         ),
      //       );
      //     },
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Push count: "),
            Text("$_counter", style: Theme.of(context).textTheme.headline4)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   var sensorInfoWidget = SensorInfoWidget;

//   @override
//   Widget build(BuildContext context) {
//     final sensorNames = [
//       "Vision",
//       "Imaging",
//       "Temperature",
//       "Radiation",
//       "Proximity",
//       "Pressure",
//       "Position",
//       "Photoelectric",
//       "Particle",
//       "Motion",
//       "Metal",
//       "Level",
//       "Leak",
//       "Humidity",
//       "Gas",
//       "Chemical",
//       "Force",
//       "Flow",
//       "Flaw",
//       "Flame",
//       "Electrical",
//       "Contact",
//       "Non-Contact"
//     ];
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//         width: width,
//         height: height,
//         child: ListView.builder(
//           itemCount: sensorNames.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: EdgeInsets.all(4),
//               child: SensorInfoWidget(
//                 context,
//                 width: width,
//                 sensor_name: sensorNames[index],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
