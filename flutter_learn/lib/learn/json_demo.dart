import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/bean/class_bean.dart';
import 'package:flutter_learn/bean/status_bean.dart';

class JsonDemo extends StatefulWidget {
  @override
  _JsonDemoState createState() => _JsonDemoState();
}

class _JsonDemoState extends State<JsonDemo> {
  String _textInfo = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemBuilder: (BuildContext ctx, int index) {
            return Text(_textInfo);
          },
          itemCount: 1,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                child: Text("load"),
                onPressed: () {
                  loadJson().then((value) {
                    setState(() {
                      _textInfo = value;
                    });
                  });
                },
              ),
              SizedBox(width: 5),
              RaisedButton(
                child: Text("parse"),
                onPressed: () {
                  var map = json.decode(_textInfo);
                  print('runtime: ${map.runtimeType}');
                  var code = map['code'];
                  var msg = map['msg'];
                  var data = map['data'];
                  print("code: $code, msg: $msg, data.length: ${data.length}");
                  var classBean = StatusBean.fromJsonMap(map);
                  var classList = classBean.data;
                  print('classBean: ${classList.length}');
                  for (var item in classList) {
                    print('item: ${item.runtimeType}');
                    var classBean = ClassBean.fromJsonMap(item);
                    for (StudentBean student in classBean.students) {
                      print('student: $student');
                    }
                  }
                },
              )
            ],
          ),
        )
      ],
    );
  }

  Future<String> loadJson() async {
    var jsonString = await rootBundle.loadString("assets/jsons/class.json");
    return jsonString;
  }
}
