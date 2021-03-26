import 'dart:math';
import 'package:flutter/material.dart';

class SliverDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
//          title: Text("Slivers"),
          elevation: 3,
//          centerTitle: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver Title"),
              background: Icon(Icons.build),
//            titlePadding: EdgeInsets.all(12),
              collapseMode: CollapseMode.parallax
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate((BuildContext ctx, int index) {
            return Container(color: getRandomColor());
          }, childCount: 4),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.8),
        ),
        SliverList(
          delegate: SliverChildListDelegate(List.generate(20, (index) {
            return ListTile(
              leading: Icon(Icons.book),
              title: Text("算法导论$index"),
            );
          })),
        )
      ],
    );
  }
}

class SliverDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.5),
              delegate:
              SliverChildBuilderDelegate((BuildContext ctx, int index) {
                return Container(
                  color: getRandomColor(),
                );
              }, childCount: 100),
            ),
          ),
        )
      ],
    );
  }
}

/// 获取随机颜色
Color getRandomColor() {
  return Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
}
