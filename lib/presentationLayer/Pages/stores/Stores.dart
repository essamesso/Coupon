import 'dart:io';

import 'package:copoun/DataLayer/Provider/coupon_provider.dart';
import 'package:copoun/DataLayer/Services/StoreModelServices.dart';
import 'package:copoun/presentationLayer/Widgets/categoryCardStores.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CouponProvider providercoupons = Provider.of<CouponProvider>(context);
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
        child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: Text(
                "المتاجر",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            providercoupons.store.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(top: 8),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 20,
                      ),
                      physics: ClampingScrollPhysics(),
                      itemCount: providercoupons.store.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return CategoryCardStores(
                          index: index,
                          storemodel: providercoupons.store,
                        );
                      },
                    ),
                  )
            /* FutureBuilder(
              future: StoreModelServices().getStoreModel(),
              builder: (context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      return Text('error');
                    } else {
                      store = snapshot.data;
                      return Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.only(top: 8),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.85,
                            crossAxisSpacing: 20,
                          ),
                          physics: ClampingScrollPhysics(),
                          itemCount: store.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return CategoryCardStores(
                              index: index,
                              storemodel: store,
                            );
                          },
                        ),
                      );
                    }
                }
              },
            ),*/
          ],
        ),
      )),
    );
  }
}
