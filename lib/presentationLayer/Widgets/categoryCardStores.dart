import 'package:copoun/configuration.dart';
import 'package:flutter/material.dart';

class CategoryCardStores extends StatefulWidget {
  final int index;
  CategoryCardStores({this.index});
  @override
  _CategoryCardStoresState createState() =>
      _CategoryCardStoresState();
}

class _CategoryCardStoresState extends State<CategoryCardStores> {
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
