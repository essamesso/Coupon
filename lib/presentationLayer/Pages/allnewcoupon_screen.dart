import 'package:copoun/DataLayer/Models/NewCouponmodel.dart';
import 'package:copoun/DataLayer/Models/urlimagemodel.dart';
import 'package:copoun/DataLayer/Services/newcouponservices.dart';
import 'package:copoun/presentationLayer/Widgets/AllCouponswidgets.dart';
import 'package:flutter/material.dart';

class NewCouponScreen extends StatefulWidget {
  @override
  _NewCouponScreenState createState() => _NewCouponScreenState();
}

class _NewCouponScreenState extends State<NewCouponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: NewCouponServices().getnewcoupon(),
          builder: (context, AsyncSnapshot snapshot) {
            List<NewCoupon> values = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return FutureBuilder(
                    future: NewCouponServices().getimageurl(),
                    builder: (context, AsyncSnapshot snapshot) {
                      List<URLimageurlmodel> imageurl = snapshot.data;
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError)
                            return Text('Error: ${snapshot.error}');
                          else
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: values.length,
                                itemBuilder: (context, index) {
                                  return AllCouponswidgets(
                                      values: values, index: index,imageurl:imageurl[index].guid.rendered,);
                                });
                      }
                    },
                  );
            }
          },
        ),
      ),
    );
  }
}
