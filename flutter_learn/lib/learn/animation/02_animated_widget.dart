import 'package:flutter/material.dart';

/// 1. 创建AnimatedWidget对象，返回要创建动画的Widget
/// 2. 替换动画Widget
class AnimationWidgetDemo extends StatefulWidget {
  @override
  _AnimationWidgetDemoState createState() => _AnimationWidgetDemoState();
}

class _AnimationWidgetDemoState extends State<AnimationWidgetDemo>
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
        title: Text("Animation Widget"),
      ),
      body: Center(
        child: AnimationIcon(_sizeAnim),
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

class AnimationIcon extends AnimatedWidget {
  AnimationIcon(Animation anim) : super(listenable: anim);

  @override
  Widget build(BuildContext context) {
    Animation anim = listenable;
    return Icon(Icons.ac_unit, color: Colors.red, size: anim.value);
  }
}
