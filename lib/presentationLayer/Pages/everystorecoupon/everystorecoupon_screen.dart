import 'package:copoun/DataLayer/Models/EveryStoreCouponModel.dart';
import 'package:copoun/DataLayer/Services/everycouponinstoreservices.dart';
import 'package:copoun/presentationLayer/Widgets/everycouponwidget.dart';
import 'package:flutter/material.dart';

class EveryStoreCoupon extends StatelessWidget {
  final int id;
  final String image, title;
  EveryStoreCoupon({Key key, this.id, this.image, this.title})
      : super(key: key);
  List<EveryStoreCouponModel> coupon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
          title: Column(
        children: [
          Hero(
            tag: title,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(image),
            ),
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ],
      )),
      body: Column(
        children: [
          FutureBuilder(
            future: EveryCouponinStore().geteverycouponinstore(id),
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ));
                default:
                  if (snapshot.hasError) {
                    return Center(child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text('No Coupons Found',style: TextStyle(
                        fontSize: 20
                      ),),
                    ));
                  } else {
                    coupon = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(0.0),
                        shrinkWrap: true,
                        itemCount: coupon.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          // print(coupon[i].title);
                          return GetEveryCouponStore(
                            index: i,
                            values: coupon,
                          );
                        },
                      ),
                    );
                  }
              }
            },
          ),
        ],
      ),
    );
  }
}
