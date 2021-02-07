import 'dart:io';

import 'package:copoun/DataLayer/Models/StoreModel.dart';
import 'package:copoun/presentationLayer/Pages/stores/Stores.dart';
import 'package:copoun/presentationLayer/Widgets/SectionTitle.dart';
import 'package:flutter/material.dart';
import 'listviewcoupon.dart';
import 'listviewstore.dart';

class HomeWiget extends StatelessWidget {
  List<StoreModel> stores;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SectionTitle(
                  title: 'Stores',
                  press: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Stores()));
                  },
                ),
                Container(
                  height: size.height * .11,
                  child: ListViewStore(),

                  /*stores != null
                  ? Expanded(
                      child: ListViewStore(),
                    )
                  : FutureBuilder(
                      future: StoreModelServices().getStoreModel(),
                      builder: (context, AsyncSnapshot snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return SizedBox.shrink();
                          default:
                            if (snapshot.hasError) {
                              return Text('error');
                            } else {
                              stores = snapshot.data;
                              return Expanded(
                                child: ListViewStore(stores: stores),
                              );
                            }
                        }
                      },
                    ),*/
                ),
                 Align(
      alignment: Alignment.centerLeft,
      child:  Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
            "All new Coupons",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
      ),
      
    ),
                CreateListView()
              ],
            ),
          ),
        ));
  }
}
