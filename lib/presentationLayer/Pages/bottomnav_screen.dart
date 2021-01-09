import 'package:copoun/presentationLayer/Pages/favourite_screen.dart';
import 'package:copoun/presentationLayer/Pages/home/home.dart';
import 'package:copoun/presentationLayer/Pages/matager.dart';
import 'package:copoun/presentationLayer/Widgets/BNBCustomPainter.dart';
import 'package:flutter/material.dart';
import 'drawer_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTab = 2;
  _BottomNavBarState({this.currentTab});

  PageController _pageController = PageController();

  List<Widget> _screens = [
    HomeScreen(),
    Matager(),
    HomeScreen(),
    FavouriteScreen(),
    HomeScreen()
  ];

  void _onPagechanged(int index) {
    setState(() {
      currentTab = index;
    });
  }

  void onItemTapped(int selectedIndex) {
    print('selectedIndex $selectedIndex');
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          DrawerScreen(),
          PageView(
            controller: _pageController,
            children: _screens,
            onPageChanged: _onPagechanged,
            physics: NeverScrollableScrollPhysics(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 60,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 60),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      onPressed: () {
                        this.onItemTapped(2);
                      },
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.home),
                      elevation: 0.1,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: () {
                            this.onItemTapped(0);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark),
                          onPressed: () {
                          this.onItemTapped(1);
                          },
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        height: 50.0,
        items: <Widget>[
          Column(
            children: [
              Icon(Icons.home, size: 30),Text("الرئيسية"),
            ],
          ),
           Column(
            children: [
              Icon(Icons.home, size: 30),Text("المتاجر"),
            ],
          ),
           Column(
            children: [
              Icon(Icons.home, size: 30),Text("المفضلة"),
            ],
          ),
           Column(
            children: [
              Icon(Icons.home, size: 30),Text("كل الكوبونات"),
            ],
          ),
           Column(
            children: [
              Icon(Icons.home, size: 30),Text("الاعدادات"),
            ],
          ),
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
  }*/
//}
