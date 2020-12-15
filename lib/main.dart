import 'package:copoun/presentationLayer/Pages/bottomnav_screen.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: MyApp(),
  theme: ThemeData(
    fontFamily: 'Circular'
  ),
  ));
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BottomNavBar() 
    );
  }
}