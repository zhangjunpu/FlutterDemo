import 'dart:io';

import 'package:flutter/cupertino.dart';

class FutureDemo extends StatefulWidget {
  @override
  _FutureDemoState createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  @override
  void initState() {
    print("start");

    requestNetwork().then((value) {
      print("value: $value");
    }).catchError((err) {
      print("err: $err");
    });

    print("end");
    super.initState();
  }

  /// async、await
  Future<String> requestNet() async {
    return Future.delayed(Duration(seconds: 3), () => "Hello async, await");
  }

  /// Future
  Future<String> requestNetwork() {
    return Future<String>(() {
      sleep(Duration(seconds: 3));
      return "Hello Flutter";
    }).then((value) {
      print("value: $value");
      throw Exception("Future error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
