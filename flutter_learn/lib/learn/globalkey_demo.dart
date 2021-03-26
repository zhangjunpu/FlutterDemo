import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<_GlobalKeyDemoState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KeyDemo"),
      ),
      body: GlobalKeyDemo(key: key),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.folder_open),
        onPressed: () {
          String name = key.currentState.widget.name;
          String wife = key.currentState.wife;
          print('name: $name, wife: $wife');
        },
      ),
    );
  }
}

class GlobalKeyDemo extends StatefulWidget {
  final String name = "王小波";

  GlobalKeyDemo({Key key}) : super(key: key);

  @override
  _GlobalKeyDemoState createState() => _GlobalKeyDemoState();
}

class _GlobalKeyDemoState extends State<GlobalKeyDemo> {
  final String wife = "李银河";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          widget.name,
          style: TextStyle(color: Color(0xff666666), fontSize: 18),
        ),
        subtitle: Text(
          wife,
          style: TextStyle(color: Color(0xff999999), fontSize: 14),
        ),
      ),
    );
  }
}
