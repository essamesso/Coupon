import 'package:copoun/DataLayer/Models/coupondb.dart';
import 'package:copoun/presentationLayer/Widgets/coupons_offers.dart';
import 'package:copoun/presentationLayer/utils/dbhelper.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  DbHelper helper;
  List allCoupon = new List();
  var filteredCoupon = List();

  void getCourses() {
    helper.allCoupon().then((courses) {
      setState(() {
        allCoupon = courses;
        filteredCoupon = allCoupon;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
    getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: filteredCoupon.length == 0
          ? Center(child: Text("no data"))
          : ListView.builder(
              padding: EdgeInsets.all(0.0),
              shrinkWrap: true,
              itemCount: filteredCoupon.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                CouponModel coupons = CouponModel(filteredCoupon[i]);
                return GetCouponItems(coupons: coupons, index: i);
              },
            ),
    ));
  }
}
