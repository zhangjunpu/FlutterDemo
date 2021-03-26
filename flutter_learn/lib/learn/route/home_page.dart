import 'package:flutter/material.dart';
import 'package:flutter_learn/learn/route/route.dart';
import 'package:flutter_learn/learn/route/setting_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _message = "home page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_message, style: TextStyle(fontSize: 20)),
              RaisedButton(
                child: Text("设置"),
                onPressed: () => _gotoSetting(context),
              ),
              RaisedButton(
                child: Text("关于我们"),
                onPressed: () => _gotoAbout(context),
              ),
              RaisedButton(
                child: Text("设置2"),
                onPressed: () => _gotoSetting2(context),
              ),
              RaisedButton(
                child: Text("Unknown"),
                onPressed: () => _gotoUnknown(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _gotoSetting(BuildContext context) {
    final result = Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SettingPage("a setting message"),
      ),
    );

    result.then((value) {
      this.setState(() {
        _message = value;
      });
    });
  }

  void _gotoAbout(BuildContext context) {
    final args = {"name": "Junpu", "age": 18};
    final result = Navigator.of(context)
        .pushNamed(RouteManager.routeAbout, arguments: args);

    result.then((value) {
      this.setState(() {
        _message = value;
      });
    });
  }

  void _gotoSetting2(BuildContext context) {
    final result = Navigator.of(context)
        .pushNamed(RouteManager.routeSetting, arguments: "a setting message2");

    result.then((value) {
      this.setState(() {
        _message = value;
      });
    });
  }

  void _gotoUnknown(BuildContext context) {
    Navigator.pushNamed(context, "/unknown");
  }
}
