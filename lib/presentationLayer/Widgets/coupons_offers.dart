import 'package:badges/badges.dart';
import 'package:copoun/DataLayer/Models/NewCouponmodel.dart';
import 'package:copoun/DataLayer/Models/coupondb.dart';
import 'package:copoun/presentationLayer/Widgets/advanceCustomAlert.dart';
import 'package:clipboard/clipboard.dart';
import 'package:copoun/presentationLayer/utils/dbhelper.dart';
import 'package:flutter/material.dart';

class GetCouponItems extends StatefulWidget {
  GetCouponItems({
    Key key,
    this.values,
    this.index,
    this.coupons,
  }) : super(key: key);

  final List<NewCoupon> values;

  final CouponModel coupons;
  final int index;

  @override
  _GetCouponItemsState createState() => _GetCouponItemsState();
}

class _GetCouponItemsState extends State<GetCouponItems> {
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  DbHelper helper;
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    String imageurl = widget.values != null
        ? widget.values[widget.index].betterFeaturedImage.mediaDetails.sizes
            .wpcouponSmallThumb.sourceUrl
        : widget.coupons.imageurl;

    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withAlpha(100), blurRadius: 10.0),
                    ]),
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(widget.values != null
                                      ? Icons.share
                                      : Icons.delete_outline),
                                  onPressed: () {
                                    setState(() {
                                      Future<int> id =  helper
                                          .deleteCoupon(widget.index);
                                      print('remove>>> $id');
                                    });
                                  },
                                ),
                                SizedBox(width: 30),
                                IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: () async {
                                    CouponModel coupon = CouponModel({
                                      'title': widget
                                          .values[widget.index].title.rendered,
                                      'code': 'sdsdsd',
                                      'imageurl': widget
                                          .values[widget.index]
                                          .betterFeaturedImage
                                          .mediaDetails
                                          .sizes
                                          .wpcouponSmallThumb
                                          .sourceUrl,
                                      'linksite': 'asasasasas.com',
                                    });
                                    int id = await helper.createCoupon(coupon);
                                    print('add>>> $id');
                                  },
                                ),
                              ],
                            ),
                            /*CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(imageurl)),*/
                            Image.asset(
                              'assets/images/logo.png',
                              width: 100,
                              height: 40,
                            )
                          ],
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.black,
                        ),
                        /*   Text(
                  'خصم حتى 60% على منتاجات العناية بالشعر ',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),*/
                        Text(
                          '${widget.values != null ? widget.values[widget.index].title.rendered : widget.coupons.title}',
                          style: TextStyle(fontSize: 14),
                          textDirection: TextDirection.rtl,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 35,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                color: Colors.orange,
                                child: Center(
                                    child: Text('تسوق الآن',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))),
                                onPressed: () {
                                  AdvanceCustomAlert();
                                  /* showModalBottomSheet(
                            context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height/2.2,
                                  color: Colors.grey[400],
                                  child: AdvanceCustomAlert(),
                                );
                              }
                           );*/

                                  /*  showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AdvanceCustomAlert();
                              });*/
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: 35,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/copy.jpg"),
                                        fit: BoxFit.fill)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      child: Text('sdsd'),
                                      onTap: () async {
                                        await FlutterClipboard.copy('sdsd');
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text("✓  تم نسخ كود الخصم")),
                                        );
                                      },
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.content_copy),
                                        onPressed: () async {
                                          await FlutterClipboard.copy('sdsdsd');
                                          Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    "✓  تم نسخ كود الخصم")),
                                          );
                                        })
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              onTap: () {},
            ),
            Positioned(
              top: -2,
              right: -2,
              child: Badge(
                toAnimate: true,
                shape: BadgeShape.square,
                badgeColor: Colors.pink,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
                badgeContent:
                    Text('New', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
/*Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                image: DecorationImage(
                    image: AssetImage("assets/imgs/تنزيل-_-1@3x.png"),
                    fit: BoxFit.cover)),
          ),*/
