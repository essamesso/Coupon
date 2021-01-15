import 'package:copoun/presentationLayer/Pages/bottomnav_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DataLayer/Provider/coupon_provider.dart';
import 'DataLayer/Provider/dataprovider .dart';
import 'DataLayer/Provider/dbhelper .dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DBHelper()),
        ChangeNotifierProxyProvider<DBHelper, DataProvider>(
          create: (context) => DataProvider([], null), 
          update: (context, db, previous) => DataProvider(previous.items, db),
        ),
        ChangeNotifierProvider(create: (context) => CouponProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
        theme: ThemeData(fontFamily: 'Circular',
       scaffoldBackgroundColor: Colors.white),
      ),
    );
  }
}
