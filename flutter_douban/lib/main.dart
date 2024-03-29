import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/main/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // highlightColor: Colors.transparent
      ),
      home: MainPage(),
    );
  }
}
