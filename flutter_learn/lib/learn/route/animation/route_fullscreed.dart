import 'package:flutter/material.dart';

class RouteFullScreedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full Screen"),
      ),
      body: Center(
        child: Text("Full Screen", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
