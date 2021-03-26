import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class HomeCounter extends InheritedWidget {
  final int counter;

  HomeCounter({this.counter, Widget child}) : super(child: child);

  static HomeCounter of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeCounter>();
  }

  /// 决定调用组件会不会回调didChangeDependencies方法
  @override
  bool updateShouldNotify(HomeCounter oldWidget) {
    return counter != oldWidget.counter;
  }
}

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
  int counter = 100;

  @override
  Widget build(BuildContext context) {
    print('_HomePageState.build');
    return Scaffold(
      appBar: AppBar(
        title: Text("App State"),
      ),
      body: HomeCounter(
          counter: counter,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppStateDemo1(),
                AppStateDemo2(),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          this.setState(() {
            counter += 1;
          });
        },
      ),
    );
  }
}

class AppStateDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('AppStateDemo1.build');
    int counter = HomeCounter.of(context).counter;
    return Container(
      color: Colors.green,
      child: Text("当前计数：$counter", style: TextStyle(fontSize: 30)),
    );
  }
}

class AppStateDemo2 extends StatefulWidget {
  @override
  _AppStateDemo2State createState() => _AppStateDemo2State();
}

class _AppStateDemo2State extends State<AppStateDemo2> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('_AppStateDemo2State.didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('AppStateDemo2.build');
    int counter = HomeCounter.of(context).counter;
    return Container(
      color: Colors.red,
      child: Text("当前计数：$counter", style: TextStyle(fontSize: 30)),
    );
  }
}
