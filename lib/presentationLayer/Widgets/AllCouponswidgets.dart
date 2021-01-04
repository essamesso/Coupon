import 'package:copoun/DataLayer/Models/NewCouponmodel.dart';
import 'package:flutter/material.dart';
class AllCouponswidgets extends StatelessWidget {
  const AllCouponswidgets({
    Key key,
    @required this.values, this.index, this.imageurl,

  }) : super(key: key);

  
  final int index;
  final String imageurl;
  final List<NewCoupon> values;
String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );
    return htmlText.replaceAll(exp, '');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey),
            child: Text(' ${values[index].title.rendered}',style: TextStyle(color:Colors.red),textDirection: TextDirection.rtl,)),
          Image.network(imageurl),
          Text(removeAllHtmlTags(values[index].content.rendered),textDirection: TextDirection.rtl),
        ],
      ));
  }
}
