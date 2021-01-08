import 'package:copoun/DataLayer/Models/NewCouponmodel.dart';
import 'package:copoun/DataLayer/Services/newcouponservices.dart';
import 'package:flutter/material.dart';

class AllCouponswidgets extends StatelessWidget {
  const AllCouponswidgets({
    Key key,
    @required this.values,
    this.index,
  }) : super(key: key);

  final int index;
  final List<NewCoupon> values;
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  /*FutureBuilder(
                    future: NewCouponServices().getimageurl(''),
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
                  );*/
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewCouponServices()
          .getnewcoupon(),
      builder: (context, AsyncSnapshot snapshot) {
        String imageurl = values[index].betterFeaturedImage.mediaDetails.sizes.wpcouponSmallThumb.sourceUrl;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container();
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Image.network(imageurl),
                       Text(
                            ' ${values[index].title.rendered}',
                            style: TextStyle(color: Colors.red),
                            textDirection: TextDirection.rtl,
                          ),
                          InkWell(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width / 3,
                                  height: 35,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), 
                                  color: Colors.redAccent,),
                        
                        child: Center(child: Text('عرض الكوبون', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),                      
                      /*Text(removeAllHtmlTags(values[index].content.rendered),
                          textDirection: TextDirection.rtl),*/
                    ],
                  ));
        }
      },
    );
  }
}
