import 'package:flutter/material.dart';
import 'package:flutter_learn/learn/state/viewmodel/counter_provider.dart';
import 'package:flutter_learn/learn/state/model/userinfo.dart';
import 'package:flutter_learn/learn/state/viewmodel/userinfo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => CounterProvider()),
      ChangeNotifierProvider(
          create: (ctx) => UserInfoProvider(UserInfo("1", "Junpu", 18))),
    ],
    child: MyApp(),
  ));
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
  @override
  Widget build(BuildContext context) {
    print('_HomePageState.build');
    return Scaffold(
      appBar: AppBar(
        title: Text("App State Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StateDemo1(),
            StateDemo2(),
          ],
        ),
      ),
      floatingActionButton: Selector<CounterProvider, CounterProvider>(
        selector: (ctx, counter) => counter,
        builder: (ctx, counter, child) {
          print('_HomePageState Consumer.build');
          return FloatingActionButton(
            child: child,
            onPressed: () {
              counter.counter += 1;
            },
          );
        },
        shouldRebuild: (prev, next) => prev.counter != next.counter,
        child: Icon(Icons.add_box),
      ),
    );
  }
}

class StateDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('StateDemo1.build');
    int counter = Provider.of<CounterProvider>(context).counter;
    return Container(
      color: Colors.red,
      child: Text("当前计数: $counter", style: TextStyle(fontSize: 30)),
    );
  }
}

class StateDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('StateDemo2.build');
    return Container(
      color: Colors.blue,
      child: Consumer2<CounterProvider, UserInfoProvider>(
        builder: (ctx, counter, user, child) {
          print('StateDemo2 Consumer.build');
          return Text("${user.userInfo.name}: ${counter.counter}",
              style: TextStyle(fontSize: 30));
        },
      ),
    );
  }
}
