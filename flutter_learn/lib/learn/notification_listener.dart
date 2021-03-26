import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _controller = ScrollController();
  var _isShowTop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll Notification"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification callback) {
          if (callback is ScrollStartNotification) {
            print("scroll start");
          } else if (callback is ScrollUpdateNotification) {
            var curScroll = callback.metrics.pixels;
            var maxScroll = callback.metrics.maxScrollExtent;
            print("scroll: $curScroll / $maxScroll");
            setState(() {
              _isShowTop = curScroll > 500;
            });
          } else if (callback is ScrollEndNotification) {
            print("scroll end");
          }
          return true;
        },
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.5),
          itemBuilder: (BuildContext ctx, int index) {
            return Container(color: Colors.blue);
          },
          itemCount: 100,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          controller: _controller,
        ),
      ),
      floatingActionButton: _isShowTop
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            )
          : null,
    );
  }
}
