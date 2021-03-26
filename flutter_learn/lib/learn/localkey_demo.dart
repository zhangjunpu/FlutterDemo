
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> names = ["aaa", "bbb", "ccc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KeyDemo"),
      ),
      body: ListView(
        children:
        names.map((name) => LocalKeyItemFul(name, key: ValueKey(name))).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            names.removeAt(0);
          });
        },
      ),
    );
  }
}

class LocalKeyItemLess extends StatelessWidget {
  final String name;

  LocalKeyItemLess(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      color: Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      ),
    );
  }
}

class LocalKeyItemFul extends StatefulWidget {
  final String name;

  LocalKeyItemFul(this.name, {Key key}) : super(key: key);

  @override
  _LocalKeyItemFulState createState() => _LocalKeyItemFulState();
}

class _LocalKeyItemFulState extends State<LocalKeyItemFul> {
  Color color = Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Text(
        widget.name,
        style: TextStyle(color: Colors.white),
      ),
      color: color,
    );
  }
}
