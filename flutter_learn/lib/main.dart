import 'package:flutter/material.dart';

import 'learn/animation/05_animation_hero.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HeroAnimationDemo(),
    );
  }
}
