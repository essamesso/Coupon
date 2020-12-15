import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'drawer_screen.dart';
import 'favourite_screen.dart';
import 'home.dart';

class BottomNavBar extends StatefulWidget {
  int currentTab;
  Widget currentPage = HomeScreen();

  BottomNavBar({this.currentTab}) {
    currentTab = currentTab != null ? currentTab : 0;
  }

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  PageController _pageController = PageController();

  List<Widget> _screens = [
    HomeScreen(),
    Favourite_Screen(),
    Favourite_Screen(),
    Favourite_Screen(),
    HomeScreen()
  ];

  void _onPagechanged(int index) {
    setState(() {
      print('index $index');
      widget.currentTab = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    print('selectedIndex $selectedIndex');
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
          Icon(Icons.call_split, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.grey[200],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int i) {
          this._onItemTapped(i);
        },
      ),
      body: Stack(
        children: [
          DrawerScreen(),
          PageView(
            controller: _pageController,
            children: _screens,
            onPageChanged: _onPagechanged,
            physics: NeverScrollableScrollPhysics(),
          ),
          //HomeScreen()
        ],
      ),
    );
  }
}
