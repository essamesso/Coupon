import 'package:copoun/DataLayer/Models/themeprovider.dart';
import 'package:copoun/presentationLayer/Widgets/DarkAndLightMode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDarkAndLightMode extends StatelessWidget {
  const MainDarkAndLightMode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return BuildDarkAndLightMode(
      themeProvider: themeProvider,
    );
  }
}

class BuildDarkAndLightMode extends StatefulWidget with WidgetsBindingObserver {
  final ThemeProvider themeProvider;

  const BuildDarkAndLightMode({Key key, @required this.themeProvider}) : super(key: key);
  @override
  _BuildDarkAndLightModeState createState() => _BuildDarkAndLightModeState();
}

class _BuildDarkAndLightModeState extends State<BuildDarkAndLightMode> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: widget.themeProvider.themeData(),
      home: DarkAndLightMode(),
    );
  }
}

// Theme Data is saved on refresh or restart
// App bar color also changes with theme