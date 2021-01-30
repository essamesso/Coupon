import 'package:copoun/DataLayer/Models/StoreModel.dart';
import 'package:copoun/DataLayer/Services/StoreModelServices.dart';
import 'package:flutter/material.dart';
import 'listviewcoupon.dart';

class HomeWiget extends StatefulWidget {
  @override
  _HomeWigetState createState() => _HomeWigetState();
}

class _HomeWigetState extends State<HomeWiget> {
  List<StoreModel> stores;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Column(children: [
               Container(
                  height: 70,
                  margin: EdgeInsets.only(top: 20),
                  child: FutureBuilder(
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
                    stores = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                    itemCount: stores.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: InkWell(
                                child: Container(
                                  child: CircleAvatar(
                radius: 25,
                backgroundImage:
                    NetworkImage(stores[index].image),
                backgroundColor: Theme.of(context).hintColor,
              ),
                                ),
                                onTap: () {},
                              ),
                            ),
                             Text(stores[index].name,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      );
                    },
                  ),
                    );
                  }
              }
            },
          ),
                ),
                CreateListView()
            ],
      ),
    );
  }

}