import 'package:copoun/DataLayer/Provider/dataprovider%20.dart';
import 'package:copoun/presentationLayer/Widgets/coupons_offers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providercoupons = Provider.of<DataProvider>(context);
    print('>>>>esas>>>>>> ${providercoupons.items}');
    return Scaffold(
        body:  providercoupons.items.length == 0
          ? Center(child: Text("NO Favourite Items Found",style: TextStyle(
            fontSize: 20,
            color:Colors.black
          ),))
          : ListView.builder(
              padding: EdgeInsets.all(0.0),
              shrinkWrap: true,
              itemCount: providercoupons.items.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return GetCouponItems(
                    isfav: true, favcoupon: providercoupons.items[i]);
              },
            
    ));
  }
}
