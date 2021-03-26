import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      color: Color(0xfff2f3f4),
      child: ListView(
        children: <Widget>[
          HomeItem("Cat", "a cat",
              "https://pixabay.com/get/54e0dd404e5bae14f1dc8460962930781238dfe7514c704c7c297dd59e4cc251_640.jpg"),
//          SizedBox(
//            height: 5,
//          ),
          HomeItem("People", "a person",
              "https://pixabay.com/get/5ee3d2424f54b10ff3d8992cc62f3179123edce74e50744073297add9448c5_640.jpg"),
//          SizedBox(
//            height: 5,
//          ),
          HomeItem("Horse", "a horse",
              "https://pixabay.com/get/55e5d0424251ae14f1dc8460962930781238dfe7514c704c7c297dd59e49c751_640.jpg"),
        ],
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  final String name;
  final String desc;
  final String imageUrl;

  HomeItem(this.name, this.desc, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(fontSize: 18, color: Color(0xFF222222)),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),
            SizedBox(
              height: 2,
            ),
            Image.network(imageUrl)
          ],
        ),
      ),
    );
  }
}
