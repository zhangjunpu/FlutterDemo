import 'package:flutter/material.dart';
import 'package:flutter_learn/learn/route/animation/route_fade.dart';
import 'package:flutter_learn/learn/route/animation/route_fullscreed.dart';

class RouteAnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RouteAnimationPage(),
    );
  }
}

class RouteAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Animation"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 底部弹窗
              RaisedButton(
                child: Text("full screed"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) {
                      return RouteFullScreedPage();
                    },
                    fullscreenDialog: true,
                  ));
                },
              ),
              // 渐变动画
              RaisedButton(
                child: Text("fade"),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (ctx, anim1, anim2) {
                        return FadeTransition(
                          opacity: anim1,
                          child: RouteFadePage(),
                        );
                      },
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text("other"),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      // transitionDuration: Duration(seconds: 1),
                      pageBuilder: (ctx, anim1, anim2) {
                        return RotationTransition(
                          turns: anim1,
                          child: RouteFadePage(),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
