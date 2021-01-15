import 'package:copoun/DataLayer/Models/NewCouponmodel.dart';
import 'package:copoun/DataLayer/Models/coupondb.dart';
import 'package:copoun/DataLayer/Provider/dataprovider%20.dart';
import 'package:copoun/presentationLayer/Widgets/advanceCustomAlert.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetCouponItems extends StatefulWidget {
  GetCouponItems({
    Key key,
    this.values,
    this.index,
    this.isfav = false,
    this.favcoupon,
  }) : super(key: key);

  final List<NewCoupon> values;
  final int index;
  final bool isfav;
  final CouponModel favcoupon;

  @override
  _GetCouponItemsState createState() => _GetCouponItemsState();
}

class _GetCouponItemsState extends State<GetCouponItems> {
  String imageurl;
  bool isfavitemlist;


  List getids(List<CouponModel> coupons)  {
      List ids = [];
    for (int i = 0; i < coupons.length; i++) {
     ids.add(coupons[i].id);
    }
    return ids;
  }

  @override
  Widget build(BuildContext context) {
    var providercoupons = Provider.of<DataProvider>(context);
    List ids = getids(providercoupons.items);
    imageurl = !widget.isfav
        ? widget.values[widget.index].betterFeaturedImage.mediaDetails.sizes
            .wpcouponSmallThumb.sourceUrl
        : widget.favcoupon.imageurl;
    return Padding(
      padding: const EdgeInsets.all(3),
      child:  InkWell(
            child: Card(
              margin: EdgeInsets.only(top: 10 ,left: 5,right: 5),
              elevation: 3,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
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
                                icon: Icon(!widget.isfav
                                    ? Icons.share
                                    : Icons.delete_outline,color:  Colors.orange,),
                                onPressed: () {
                                  if (widget.isfav) {
                                    providercoupons
                                        .delletcoupon(widget.favcoupon.id);
                                  } else {
                                    print(' //on pess share');
                                  }
                                },
                              ),
                              SizedBox(width: 30),
                              !widget.isfav
                                  ? IconButton(
                                      icon: Icon(
                                        !ids.contains(
                                                widget.values[widget.index].id)
                                            ? Icons.favorite_border
                                            : Icons.favorite,
                                        color:  Colors.orange,
                                      ),
                                      onPressed: () async {
                                        if (ids.contains(
                                            widget.values[widget.index].id)) {
                                               setState(() {
                                            ids.clear();
                                            //isfavitemlist = false;
                                          });
                                          providercoupons.delletcoupon(
                                              widget.values[widget.index].id);
                                        } else {
                                          setState(() => ids.clear());
                                          providercoupons.addcoupon({
                                            'id': widget.values[widget.index].id,
                                            'title': widget.values[widget.index]
                                                .title.rendered,
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
                                        }
                                      },
                                    )
                                  : SizedBox.shrink()
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(2),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(imageurl)),
                            height: 50,
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black,
                      ),
                      Text(
                        '${!widget.isfav ? widget.values[widget.index].title.rendered : widget.favcoupon.title}',
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
                                      image: AssetImage("assets/images/copy.jpg"),
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
                                            content: Text("✓  تم نسخ كود الخصم")),
                                      );
                                    },
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.content_copy),
                                      onPressed: () async {
                                        await FlutterClipboard.copy('sdsdsd');
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text("✓  تم نسخ كود الخصم")),
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
          /* Positioned(
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
              ),*/
    );
  }
}
