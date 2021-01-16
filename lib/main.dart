import 'package:copoun/presentationLayer/Pages/bottomnav_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DataLayer/Models/themeprovider.dart';
import 'DataLayer/Provider/coupon_provider.dart';
import 'DataLayer/Provider/dataprovider .dart';
import 'DataLayer/Provider/dbhelper .dart';
import 'presentationLayer/Pages/Maindark_lightMode.dart';
import 'presentationLayer/Pages/Splash/mainSplashScreen.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);

  final settings = await Hive.openBox('settings');
  bool isLightTheme = settings.get('isLightTheme') ?? false;

  print(isLightTheme);

  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(isLightTheme: isLightTheme),
    child: MaterialApp(
      home: MyApp(),
      theme: ThemeData(fontFamily: 'Circular'),
    ),
  ));
}


class MyApp extends StatefulWidget {  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6)
      ,(){
      Navigator.push(context,MaterialPageRoute(builder: (context)=> MainDarkAndLightMode()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  MainSplashScreen();
  }
}








class RootMyApp extends StatelessWidget {
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
