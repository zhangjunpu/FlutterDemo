import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/http/http_api.dart';


/// dio demo
/// [author] junpu
/// [date] 2020/9/15
class DioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text("get"),
              onPressed: () {
                HttpApi.request("/get").then((value) {
                  print('get: $value');
                }).catchError((e) {
                  print('get err: $e');
                });
              },
            ),
            RaisedButton(
              child: Text("post"),
              onPressed: () {
                HttpApi.post(
                  "/post",
                  params: {
                    "name": "Junpu",
                    "age": 31,
                  },
                ).then((value) {
                  print('post: $value');
                }).catchError((e) {
                  print('post err: $e');
                });
                print('DioDemo.build post');
              },
            )
          ],
        ),
      ),
    );
  }
}
