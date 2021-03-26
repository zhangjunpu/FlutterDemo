import 'package:flutter/material.dart';

class GestureDemo extends StatelessWidget {
  const GestureDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        print('GestureDetector 单击按下');
        print('全局position：${details.globalPosition}');
        print('局部position：${details.localPosition}');
      },
      onTapUp: (details) {
        print('GestureDetector 单击抬起');
        print('全局position：${details.globalPosition}');
        print('局部position：${details.localPosition}');
      },
      onTapCancel: () {
        print('GestureDetector 单击取消');
      },
      onTap: () {
        print('GestureDetector 单击');
      },
      onLongPress: () {
        print('GestureDetector 长按');
      },
      onDoubleTap: () {
        print('GestureDetector 双击');
      },
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
      ),
    );
  }
}
