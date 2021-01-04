import 'package:copoun/DataLayer/Models/urlimagemodel.dart';
import 'package:copoun/DataLayer/Services/getimageurlservices.dart';
import 'package:copoun/DataLayer/Services/newcouponservices.dart';
import 'package:copoun/presentationLayer/Widgets/AllCouponswidgets.dart';
import 'package:flutter/material.dart';

class ImageUrl extends StatefulWidget {
  @override
  _ImageUrlState createState() => _ImageUrlState();
}

class _ImageUrlState extends State<ImageUrl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
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
                      itemCount: imageurl.length,
                      itemBuilder: (context, index) {
                        return Image.network(imageurl[index].guid.rendered);
                      });
            }
          },
        ),
      ),
    );
  }
}
