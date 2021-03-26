
import 'package:flutter/material.dart';

class CounterDemo extends StatefulWidget {
  @override
  _CounterDemoState createState() => _CounterDemoState();
}

class _CounterDemoState extends State<CounterDemo> {
  var num = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _getButton((flag) => setState(() => flag ? num++ : num--)),
        SizedBox(
          height: 5,
        ),
        _getText("当前分数：$num")
      ],
    );
  }
}

typedef OnNumCallback = void Function(bool);

Widget _getButton(OnNumCallback onPress) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      RaisedButton(
          child: _getText("+"),
          color: Colors.deepOrange,
          onPressed: () => onPress(true)),
      SizedBox(
        width: 5,
      ),
      MaterialButton(
        child: _getText("-"),
        color: Colors.pinkAccent,
        onPressed: () => onPress(false),
      ),
    ],
  );
}

Text _getText(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 20),
  );
}
