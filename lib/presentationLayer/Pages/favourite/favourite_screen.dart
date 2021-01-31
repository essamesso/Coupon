import 'dart:io';

import 'package:copoun/DataLayer/Provider/dataprovider%20.dart';
import 'package:copoun/presentationLayer/Widgets/coupons_offers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providercoupons = Provider.of<DataProvider>(context);
    print('>>>>esas>>>>>> ${providercoupons.items}');
    return WillPopScope(
        onWillPop: () async {
          return showDialog(
            context: context,
            child: AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to exit an App'),
              actions: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                              child: Text(
                                "cancel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                              child: Text(
                                "ok",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          exit(0);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        child:Scaffold(
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
              
      )),
    );
  }
}
