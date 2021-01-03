<<<<<<< HEAD
import 'package:copoun/presentationLayer/Pages/allnewcoupon_screen.dart';
=======
import 'package:badges/badges.dart';
import 'package:copoun/presentationLayer/Widgets/advanceCustomAlert.dart';
import 'package:clipboard/clipboard.dart';
>>>>>>> b5674eb627a9d25d811ff1e99ed8aa476fa77bb9
import 'package:flutter/material.dart';

class CouponsOffers extends StatefulWidget {
    final String text = "MMZ010";
  @override
  _CouponsOffersState createState() => _CouponsOffersState();
}

class _CouponsOffersState extends State<CouponsOffers> {
  @override
  Widget build(BuildContext context) {
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
                                Icon(Icons.share),
                                SizedBox(width: 30),
                                Icon(Icons.favorite_border),
                              ],
                            ),
                            CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/noon.jpg'),
                                radius: 25), //CircleAvat
                            /*  Image.asset(
                              'assets/images/logo.png',
                              width: 100,
                              height: 40,
                            ) */
                          ],
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.black,
                        ),
                        Text(
                          'خصم حتى 60% على منتاجات العناية بالشعر ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'خصم حتى 60% على منتاجات العناية بالشعر ',
                          style: TextStyle(fontSize: 14),
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
                                color: Colors.greenAccent,
                                child: Center(
                                    child: Text('تسوق الآن',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AdvanceCustomAlert();
                                      });
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
                                      child: Text(widget.text),
                                      onTap: () async {
                                        await FlutterClipboard.copy(widget.text);
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
                                          await FlutterClipboard.copy(widget.text);
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
<<<<<<< HEAD
                    ),
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
                Text(
                  'خصم حتى 60% على منتاجات العناية بالشعر ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'خصم حتى 60% على منتاجات العناية بالشعر ',
                  style: TextStyle(fontSize: 14),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 35,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: Colors.greenAccent,
                    child: Center(
                        child: Text('احصل على الكوبون ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      NewCouponScreen()
                      ));
                    },
                  ),
                )
              ],
            )),
      ),
      onTap: () {},
=======
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
>>>>>>> b5674eb627a9d25d811ff1e99ed8aa476fa77bb9
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
