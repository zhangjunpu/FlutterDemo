import 'package:flutter/material.dart';

import 'UserInfoEvent.dart';
import 'eventbus.dart';
import 'user_info.dart';

class EventBusDemo extends StatelessWidget {
  const EventBusDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(),
          MyText(),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Click Me"),
      onPressed: () {
        final user = UserInfo("Junpu", 18);
        // 2. 发送Event事件
        eventBus.fire(UserInfoEvent(user));
      },
    );
  }
}

class MyText extends StatefulWidget {
  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  String _message = "Hello World";

  @override
  void initState() {
    super.initState();
    // 3. 接收Event事件
    eventBus.on<UserInfoEvent>().listen((event) {
      final user = event.userInfo;
      this.setState(() {
        _message = "${user.name}(${user.age})";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_message, style: TextStyle(fontSize: 20)),
    );
  }
}
