import 'package:copoun/DataLayer/Models/StoreModel.dart';
import 'package:copoun/presentationLayer/Pages/everystorecoupon/everystorecoupon_screen.dart';
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
              Hero(
                tag: storemodel[index].name,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(storemodel[index].image),
                  backgroundColor: Theme.of(context).hintColor,
                ),
              ),
              Text(
                storemodel[index].name,
                maxLines: 2,
              ),
            ],
          ),
        ),
        onTap: () {
          var id = storemodel[index].id;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EveryStoreCoupon(
                      id: id,
                      title: storemodel[index].name,
                      image: storemodel[index].image)));
        },
      );
  }
}
