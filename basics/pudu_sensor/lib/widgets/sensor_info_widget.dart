import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SensorInfoWidget extends StatefulWidget {
  final width;
  final sensor_name;
  SensorInfoWidget(BuildContext context,
      {Key? key, this.width, this.sensor_name})
      : super(key: key);

  @override
  _SensorInfoWidgetState createState() => _SensorInfoWidgetState();
}

class _SensorInfoWidgetState extends State<SensorInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(15),
      ),
      width: widget.width,
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sensor Name",
                    style: TextStyle(color: Colors.white60, fontSize: 22)),
                Text(widget.sensor_name,
                    style: TextStyle(color: Colors.white60, fontSize: 22))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Status",
                    style: TextStyle(color: Colors.white60, fontSize: 22)),
                Text("Connected",
                    style: TextStyle(color: Colors.white60, fontSize: 22))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Presence",
                    style: TextStyle(color: Colors.white60, fontSize: 22)),
                Icon(
                  Icons.wifi,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
