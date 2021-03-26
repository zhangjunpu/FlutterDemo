import 'package:flutter/material.dart';

class HeroAnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation"),
      ),
      body: GridView(
        padding: EdgeInsets.all(5.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 16 / 9,
        ),
        children: List.generate(100, (index) {
          String imageUrl = "https://picsum.photos/500/500?random=$index";
          return GestureDetector(
            onTap: () {
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (ctx, anim1, anim2) {
                  return FadeTransition(
                    opacity: anim1,
                    child: HeroAnimationDetailPage(imageUrl),
                  );
                },
              ));
            },
            child: Hero(
              tag: imageUrl,
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          );
        }),
      ),
    );
  }
}

class HeroAnimationDetailPage extends StatelessWidget {
  final String imageUrl;

  const HeroAnimationDetailPage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Hero(tag: imageUrl, child: Image.network(imageUrl)),
        ),
      ),
    );
  }
}
