import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: 140,
            height: 60,
            color: Colors.green,
          ),
          Container(
            width: 70,
            height: 200,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
