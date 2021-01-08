import 'package:copoun/presentationLayer/Widgets/BottomNav.dart';
import 'package:flutter/material.dart';
class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
                      child: Stack(
        children: [
            Container(
        width: double.infinity,
        color: Colors.amber,
      ),
        BottomNav(),
        ],
      ),
          ),
    );
  }
}