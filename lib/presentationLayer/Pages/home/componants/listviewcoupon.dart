import 'package:copoun/DataLayer/Provider/coupon_provider.dart';
import 'package:copoun/presentationLayer/Widgets/coupons_offers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CouponProvider providercoupons = Provider.of<CouponProvider>(context);
    return providercoupons.showprogress
        ? Center(child: CircularProgressIndicator())
        : Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0.0),
              shrinkWrap: true,
              itemCount: providercoupons.coupon.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return GetCouponItems(
                  index: i,
                  values: providercoupons.coupon,
                );
              },
            ),
          );
  }
}
