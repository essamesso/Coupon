import 'package:flutter/material.dart';

class Coupons_Offers extends StatefulWidget {
  @override
  _Coupons_OffersState createState() => _Coupons_OffersState();
}

class _Coupons_OffersState extends State<Coupons_Offers> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top:10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),

        child: Padding(
            padding: const EdgeInsets.symmetric(vertical:15,horizontal: 20 ),
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
                    onPressed: () {},
                  ),
                )
              ],
            )),
      ),
      onTap: () {},
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
