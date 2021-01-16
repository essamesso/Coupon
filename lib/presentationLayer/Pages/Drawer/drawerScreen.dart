import 'package:copoun/presentationLayer/Pages/Maindark_lightMode.dart';
import 'package:flutter/material.dart';
import '../favourite_screen.dart';
import 'contactUs.dart';
import 'shareApp.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[350],
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.orange[200],
                backgroundImage: AssetImage("assets/images/logo.png"),
                radius: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'كوبونوفا',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                  Text('أحصل الآن علي أكواد خصم كوبونوفا',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
            children: [
              InkWell(
                child: Container(
                  height: 60,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/languages-1@3x.png",
                        width: 34,
                        height: 34,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "تغيير اللغة",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavouriteScreen()));
                },
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/monitor.png",
                        width: 34,
                        height: 34,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "الوضع الليلي والنهاري",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainDarkAndLightMode()));
                },
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/telephone.png",
                        width: 30,
                        height: 30,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "تواصل معنا",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactUs()));
                },
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/star.png",
                        width: 35,
                        height: 35,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "قييم التطبيق",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavouriteScreen()));
                },
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/share.png",
                        width: 35,
                        height: 35,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "شارك التطبيق",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  // Share.share("couponava soon!");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShareData()));
                },
              ),
            ],
          ),
          Container(height: 50,)
        ],
      ),
    );
  }
}
