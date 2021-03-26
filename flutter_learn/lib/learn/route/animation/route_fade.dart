import 'package:flutter/material.dart';

class RouteFadePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Full Fade"),
      ),
      body: Center(
        child: Text("Full Fade", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
