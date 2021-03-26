import 'package:flutter/material.dart';

class ListenerDemo extends StatelessWidget {
  const ListenerDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print('手指按下: ${event.position}');
      },
      onPointerMove: (event) {
        print('手指移动: ${event.position}');
      },
      onPointerUp: (event) {
        print('手指抬起: ${event.position}');
      },
      onPointerCancel: (event) {
        print('手指取消: ${event.position}');
      },
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
      ),
    );
  }
}
