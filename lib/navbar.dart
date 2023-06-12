import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_kelompok_mobile/pages/home.dart';
import 'package:project_kelompok_mobile/pages/library.dart';
import 'package:project_kelompok_mobile/pages/profile.dart';
import 'package:project_kelompok_mobile/pages/search.dart';
import 'package:project_kelompok_mobile/pages/write.dart';

class navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Write',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Home(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: write(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Library(),
              );
            });
          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: search(),
              );
            });
          case 4:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ProfilePage(),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Home(),
              );
            });
        }
      },
    );
  }
}
