import 'package:badges/badges.dart';
import 'package:copoun/DataLayer/Models/NewCouponmodel.dart';
import 'package:copoun/DataLayer/Services/newcouponservices.dart';
import 'package:copoun/presentationLayer/Widgets/SearchPage.dart';
import 'package:copoun/presentationLayer/Widgets/coupons_offers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configuration.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  GlobalKey bottomNavigationKey = GlobalKey();
  bool isDrawerOpen = false;
  double topContainer = 0;

//______________________________________ScrollController
  bool closeTopContainer = false;
  bool scrollcontainer = false;
  double opacity = 0.7;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double value = controller.offset / 250;
      setState(() {
         topContainer = value;
        closeTopContainer = controller.offset > 10;
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          body: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor)
          ..rotateY(isDrawerOpen ? -0.5 : 0),
        duration: Duration(milliseconds: 150),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
        /*child: InkWell(
            onTap: () {
              if (isDrawerOpen == true) {
                setState(() {
                  xOffset = 0;
                  yOffset = 0;
                  scaleFactor = 1;
                  isDrawerOpen = false;
                });
              }
            },*/
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10, left: 10, top: 20),
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
                          : IconButton(
                              icon: Icon(
                                Icons.menu,
                                size: 32,
                              ),
                              onPressed: () {
                                setState(() {
                                  xOffset = 180;
                                  yOffset = 150;
                                  scaleFactor = .8;
                                  isDrawerOpen = true;
                                });
                              }),
                      Image.asset(
                        'assets/images/logo.png',
                        width: 150,
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Badge(
                          badgeContent: Text('5',
                              style: TextStyle(
                                color: Colors.white,
                              ))
                          //Text("5",style: TextStyle(color: Colors.white,)),
                          ,
                          position: BadgePosition(end: 1, top: .000000000001),
                          child: IconButton(
                              icon: Icon(Icons.notifications),
                              color: Colors.black,
                              onPressed: () {
                                /* Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Card_Screen()));*/
                              }),
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedOpacity(
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
                        margin: EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 20),
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
                ),
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: InkWell(
                                                              child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                    categories[index]['iconPath'],
                                    height: 45,
                                    width: 45,
                                    fit: BoxFit.fill,
                                  ),
                                  ),),
                                  onTap: (){
                                    
                                  },
                              ),
                            ),
                            //  Text(categories[index]['name'])
                          ],
                        ),
                      );
                    },
                  ),
                ),
                ListViewCoupons(
                    controller: controller, topContainer: topContainer),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewCoupons extends StatelessWidget {
  const ListViewCoupons({
    Key key,
    @required this.controller,
    @required this.topContainer,
  }) : super(key: key);

  final ScrollController controller;
  final double topContainer;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewCouponServices().getnewcoupon(),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<NewCoupon> values = snapshot.data;
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(0.0),
                 // controller: controller,
                  shrinkWrap: true,
                  itemCount: values.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    double scale = 1.0;
                    if (topContainer > 0.5) {
                      scale = i + 0.5 - topContainer * 1.569;
                      //.938
                      if (scale < 0) {
                        scale = 0;
                      } else if (scale > 1) {
                        scale = 1;
                      }
                    }
                    //int test = topContainer.toInt();
                    // topContainer > 1.0?topContainer-test:0.7

                    return //GetCouponItems(values: values,index:i);

                        Opacity(
                      opacity: scale,
                      child: Transform(
                        transform: Matrix4.identity()..scale(scale, scale),
                        alignment: Alignment.topCenter,
                        child: Align(
                            heightFactor: 0.92,
                            alignment: Alignment.topCenter,
                            child: GetCouponItems(values: values, index: i)),
                      ),
                    );
                  },
                ),
              );
            }
          //ListviewCoupon(controller: controller, topContainer: topContainer, values: values);
        }
      },
    );
  }
}
