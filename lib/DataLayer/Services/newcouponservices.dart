import 'package:copoun/DataLayer/Models/CouponsDataModel.dart';
import 'package:copoun/DataLayer/Models/NewCouponmodel.dart';
import 'package:copoun/DataLayer/Models/urlimagemodel.dart';
import 'package:copoun/configuration.dart';
import 'dart:convert';

import 'package:http/http.dart';

class NewCouponServices {
  List<NewCoupon> categories;
  String imageurls;

  Future<String> getimageurl() async {
    if (imageurls == null) {
      Response response =
          await get('https://couponava.com/wp-json/wp/v2/media/818');
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        imageurls = URLimageurlmodel.fromJson(body).guid.rendered;
        return imageurls;
      } else {
        return imageurls = '';
      }
    } else {
      return imageurls;
    }
  }

  Future<List<NewCoupon>> getnewcoupon() async {
    if (categories == null) {
      Response response = await get(api_url);
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        categories = (body as List).map((i) => NewCoupon.fromJson(i)).toList();
        return categories;
      } else {
        return categories = List();
      }
    } else {
      return categories;
    }
  }

  /*Future<List<CouponsDataModel>> getdata() async {
    if(datacoupons==null){
    Future<List<NewCoupon>> titleandsubtitle = getnewcoupon();
    Future<List<URLimageurlmodel>> imageurls=getimageurl() ;
    if(titleandsubtitle!=null && imageurls!=null){
      for(int i=0;i<titleandsubtitle.toString().length;i++ )
      {
        datacoupons.add(CouponsDataModel(title:titleandsubtitle[i].title.rendered ,image: imageurls[i].guid.rendered,subtitle:titleandsubtitle[i].content.rendered ));
      }
      return datacoupons;
    }
  }else{
          return datacoupons;
  }
  
  }*/
}
