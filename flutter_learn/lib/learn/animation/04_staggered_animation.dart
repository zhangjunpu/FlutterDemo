import 'dart:math';

import 'package:flutter/material.dart';

class StaggeredAnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("交织动画"),
      ),
      body: Center(
        child: StaggeredAnimationPage(),
      ),
    );
  }
}

class StaggeredAnimationPage extends StatefulWidget {
  @override
  _StaggeredAnimationPageState createState() => _StaggeredAnimationPageState();
}

class _StaggeredAnimationPageState extends State<StaggeredAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _animation;
  Animation _sizeAnim;
  Animation _colorAnim;
  Animation _alphaAnim;
  Animation _radiansAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    // 1. size animation
    _sizeAnim = Tween(begin: 100.0, end: 200.0).animate(_animation);
    // 2. color animation
    _colorAnim = ColorTween(begin: Colors.blue, end: Colors.red).animate(_animation);
    // 3. 透明度 animation
    _alphaAnim = Tween(begin: 1.0, end: 0.5).animate(_animation);
    // 4. 旋转角度 animation
    _radiansAnim = Tween(begin: 0.0, end: pi * 2).animate(_animation);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
      child: AnimatedBuilder(
        animation: _controller,
        builder: (ctx, child) {
          return Opacity(
            opacity: _alphaAnim.value,
            child: Transform(
              transform: Matrix4.rotationZ(_radiansAnim.value),
              alignment: Alignment.center,
              child: Container(
                width: _sizeAnim.value,
                height: _sizeAnim.value,
                color: _colorAnim.value,
              ),
            ),
          );
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
