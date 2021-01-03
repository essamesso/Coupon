import 'package:copoun/DataLayer/Models/NewCoupon.dart';
import 'package:copoun/DataLayer/Services/newcouponservices.dart';
import 'package:flutter/material.dart';


class NewCouponScreen extends StatefulWidget {
  @override
  _NewCouponScreenState createState() => _NewCouponScreenState();
}

class _NewCouponScreenState extends State<NewCouponScreen> {

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
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount:values.length,
                    itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(top:20),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey),
                            child: Text(' ${values[index].title.rendered.trimRight().trim()}',style: TextStyle(color:Colors.red),textDirection: TextDirection.rtl,)),
                          Text(removeAllHtmlTags(values[index].content.rendered),textDirection: TextDirection.rtl),
                        ],
                      ));
                  });
            }
          },
        ),
      ),
    );
  }
}
