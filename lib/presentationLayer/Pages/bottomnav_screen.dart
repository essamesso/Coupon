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
    FavouriteScreen(),
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
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
