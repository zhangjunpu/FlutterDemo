import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取Navigator.pushNamed传来的参数
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final message = "${args["name"]}-${args["age"]}";
    return Scaffold(
      appBar: AppBar(
        title: Text("关于"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            _backToPrevPages(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message, style: TextStyle(fontSize: 20)),
              RaisedButton(
                child: Text("返回"),
                onPressed: () => _backToPrevPages(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _backToPrevPages(BuildContext context) {
    Navigator.of(context).pop("back from about");
  }
}
