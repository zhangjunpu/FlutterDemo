import 'package:flutter/material.dart';

/// 动画基本使用流程
/// 1. 创建AnimationController控制器
/// 2. 创建CurvedAnimation，设置动画执行速率
/// 3. 创建Tween，设置动画value范围
/// 4. 实现addListener来刷新页面
/// 5. 在必要的地方回收AnimationController.dispose()
class AnimationBasicDemo extends StatefulWidget {
  @override
  _AnimationBasicDemoState createState() => _AnimationBasicDemoState();
}

class _AnimationBasicDemoState extends State<AnimationBasicDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _animation;
  Animation _sizeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _sizeAnim = Tween(begin: 50.0, end: 200.0).animate(_animation);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _controller.forward();
      } else if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Basic"),
      ),
      body: Center(
        child: Icon(Icons.favorite, color: Colors.red, size: _sizeAnim.value),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else if (_controller.status == AnimationStatus.forward ||
              _controller.status == AnimationStatus.dismissed) {
            _controller.forward();
          } else if (_controller.status == AnimationStatus.reverse ||
              _controller.status == AnimationStatus.completed) {
            _controller.reverse();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
