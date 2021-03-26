import 'package:flutter/material.dart';

/// 动画基本使用流程
/// 1. 将动画Widget用AnimatedBuilder包裹
class AnimationBuilderDemo extends StatefulWidget {
  @override
  _AnimationBuilderDemoState createState() => _AnimationBuilderDemoState();
}

class _AnimationBuilderDemoState extends State<AnimationBuilderDemo>
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
        title: Text("Animation Builder"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _sizeAnim,
          builder: (ctx, child) {
            return Icon(
              Icons.star,
              color: Colors.red,
              size: _sizeAnim.value,
            );
          },
        ),
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
