import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final String _message;

  SettingPage(this._message);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _backToPrevPages(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("设置"),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_message, style: TextStyle(fontSize: 20)),
                RaisedButton(
                  child: Text("返回"),
                  onPressed: () => _backToPrevPages(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _backToPrevPages(BuildContext context) {
    Navigator.of(context).pop("back from setting!");
  }
}
