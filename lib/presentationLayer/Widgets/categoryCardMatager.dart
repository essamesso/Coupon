import 'package:copoun/configuration.dart';
import 'package:flutter/material.dart';

class CategoryCardMatager extends StatefulWidget {
  final int index;
  CategoryCardMatager({this.index});
  @override
  _CategoryCardMatagerState createState() =>
      _CategoryCardMatagerState();
}

class _CategoryCardMatagerState extends State<CategoryCardMatager> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(categories[widget.index]["iconPath"]),
              backgroundColor: Theme.of(context).hintColor,
            ),
            Text(categories[widget.index]["name"]),
          ],
        ),
      ),
      onTap: () {
        /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FavouritScreen()));*/
      },
    );
  }
}
