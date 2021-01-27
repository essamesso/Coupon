import 'package:copoun/DataLayer/Provider/themeprovider.dart';
import 'package:copoun/presentationLayer/Pages/favourite/favourite_screen.dart';
import 'package:copoun/presentationLayer/Pages/stores/Stores.dart';
import 'package:copoun/presentationLayer/Widgets/BNBCustomPainter.dart';
import 'package:copoun/presentationLayer/Widgets/SearchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'componants/homewidgets.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> /*with AutomaticKeepAliveClientMixin*/ {
/*
  @override
  bool get wantKeepAlive => true;*/
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
//______________________________________ScrollController

  int currentTab = 0;
  PageController _pageController = PageController();

  List<Widget> _screens = [
    HomeWidget(),
    FavouriteScreen(),
    Stores(),
    FavouriteScreen(),
    HomeWidget()
  ];

  void _onPagechanged(int index) {
    setState(() {
      currentTab = index;
    });
  }

  void onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  //__________________
  @override
  Widget build(BuildContext context) {
    // super.build(context);
    //var data = Provider.of<FavouriteProvider>(context);
    final Size size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AnimatedContainer(
      height: MediaQuery.of(context).size.height,
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 50),
      decoration: BoxDecoration(
          color: themeProvider.isLightTheme
                                ? const Color(0xFFEEEEEE)
                                : const Color(0xFF211C1A),
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: GestureDetector(
        onTap: () {
          if (isDrawerOpen)
            setState(() {
              xOffset = 0;
              yOffset = 0;
              scaleFactor = 1;
              isDrawerOpen = false;
            });
        },
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: currentTab != 2 ? 80 : 0),
              child: PageView(
                controller: _pageController,
                children: _screens,
                onPageChanged: _onPagechanged,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            if (currentTab != 2)
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, top: 20),
                //___________app bar
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isDrawerOpen
                        ? IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                scaleFactor = 1;
                                isDrawerOpen = false;
                              });
                            },
                          )
                        : currentTab == 1
                            ? SizedBox.shrink()
                            : IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: 32,
                                ),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 190;
                                    yOffset = 120;
                                    scaleFactor = .8;
                                    isDrawerOpen = true;
                                  });
                                }),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 150,
                      height: 70,
                    ),
                    currentTab == 1
                        ? SizedBox.shrink()
                        : IconButton(
                            icon: Icon(
                              Icons.search,
                            //  color: Colors.black.withOpacity(.8),
                              size: 32,
                            ),
                            onPressed: () {
                              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage()));
                            }),
                  ],
                ),
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
                          onItemTapped(0);
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
                            icon: Icon(Icons.favorite,
                                color: currentTab == 1
                                    ? Colors.orange
                                    : Colors.black.withOpacity(.7)),
                            onPressed: () {
                              onItemTapped(1);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.bookmark,
                                color: currentTab == 2
                                    ? Colors.orange
                                    : Colors.black.withOpacity(.7)),
                            onPressed: () {
                              onItemTapped(2);
                            },
                          ),
                          Container(
                            width: size.width * 0.20,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: Colors.black.withOpacity(.7),
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.black.withOpacity(.7),
                            ),
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
      ),

      //_____________________                          search
      /* AnimatedOpacity(
                duration: const Duration(milliseconds: 150),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  height: closeTopContainer
                      ? 0
                      : MediaQuery.of(context).size.height * .07,
                  child: InkWell(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.only(
                          top: 0, bottom: 10, left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.search),
                          Text('Search Coupon & Offers'),
                          Icon(Icons.settings)
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage()));
                    },
                  ),
                ),
              ),*/

      /* if (values == null)
                FutureBuilder(
                  future: NewCouponServices().getnewcoupon(),
                  builder: (context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return CircularProgressIndicator();
                      break;
                      default:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          values = snapshot.data;
                          return CreateListView(
                              controller: controller,
                              values: values,
                              topContainer: topContainer);
                        }
                      //ListviewCoupon(controller: controller, topContainer: topContainer, values: values);
                    }
                  },
                )
              else*/
    );
  }
}
