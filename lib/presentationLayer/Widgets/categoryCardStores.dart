import 'package:copoun/DataLayer/Models/StoreModel.dart';
import 'package:flutter/material.dart';

class CategoryCardStores extends StatelessWidget {
  final List<StoreModel> storemodel;
  final int index;
  CategoryCardStores({this.index, @required this.storemodel});

  @override
  Widget build(BuildContext context) {
    if (storemodel != null)
      return InkWell(
        child: Container(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 35,
                backgroundImage:
                    NetworkImage(storemodel[index].image),
                backgroundColor: Theme.of(context).hintColor,
              ),
              Text(storemodel[index].name),
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
