import 'package:flutter/material.dart';

import '../group/group.dart';
import '../home/home.dart';
import '../mall/mall.dart';
import '../profile/profile.dart';
import '../subject/subject.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          SubjectPage(),
          GroupPage(),
          MallPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          buildItem("首页", "home"),
          buildItem("书影音", "subject"),
          buildItem("小组", "group"),
          buildItem("市集", "mall"),
          buildItem("我的", "profile"),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.greenAccent,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem buildItem(String name, String iconName) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        "assets/images/tabbar/$iconName.png",
        width: 30,
        height: 30,
        gaplessPlayback: true,
      ),
      activeIcon: Image.asset(
        "assets/images/tabbar/${iconName}_active.png",
        width: 30,
        height: 30,
        gaplessPlayback: true,
      ),
      label: name,
    );
  }
}
