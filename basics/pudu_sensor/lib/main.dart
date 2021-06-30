import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pudu_sensor/widgets/sensor_info_widget.dart';

void main() {
  runApp(MyApp());
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
      ),
      body: Container(
        width: width,
        height: height,
        child: ListView.builder(
          itemCount: sensorNames.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(4),
              child: SensorInfoWidget(
                context,
                width: width,
                sensor_name: sensorNames[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
