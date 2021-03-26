import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isTop = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView 滚动监听"),
      ),
      body: ListViewDemo((offset) {
        print("scroll to $offset");
        setState(() {
          _isTop = offset < 500;
        });
      }),
      floatingActionButton: _isTop
          ? null
          : FloatingActionButton(
              highlightElevation: 3,
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                print("tap floating button");
              },
            ),
    );
  }
}

/// 位移
typedef ScrollCallback = Function(double offset);

class ListViewDemo extends StatefulWidget {
  ScrollCallback scrollCallback;

  ListViewDemo(this.scrollCallback);

  @override
  _ListViewDemoState createState() => _ListViewDemoState(scrollCallback);
}

class _ListViewDemoState extends State<ListViewDemo> {
  ScrollCallback scrollCallback;

  _ListViewDemoState(this.scrollCallback);

  var _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      scrollCallback(_controller.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(
            height: 200,
            color: Colors.blue,
            child: Text(
              "ListView Header",
              style: TextStyle(color: Colors.orange, fontSize: 20),
            ),
          );
        } else {
          return ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("联系人$index"),
            onTap: () {
              print("tap item$index");
            },
          );
        }
      },
      controller: _controller,
    );
  }
}
