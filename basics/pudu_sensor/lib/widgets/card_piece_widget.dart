// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPieceWidget extends StatelessWidget {
  CardPieceWidget({
    Key? key,
    required this.piece_key,
    required this.piece_value,
  }) : super(key: key);
  String piece_key;
  String piece_value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              piece_key,
              style: TextStyle(fontSize: 20, color: Colors.white60),
            ),
            Text(
              piece_value,
              style: TextStyle(fontSize: 20, color: Colors.white60),
            )
          ],
        ),
      ),
    );
  }
}
