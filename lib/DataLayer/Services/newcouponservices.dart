import 'package:copoun/DataLayer/Models/NewCoupon.dart';
import 'dart:convert';

import 'package:http/http.dart';
class NewCouponServices {
  List<NewCoupon> categories;



  Future<List<NewCoupon>> getnewcoupon() async {

    /* return await http.get(rOOT_URL + slug).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = jsonDecode(response.body);
        return CategoryModel.fromJson(jsonValue);
      } else {
        var jsonValue = jsonDecode(response.body);
        return CategoryModel.fromJson(jsonValue);
      }
    });*/

    if (categories == null) {
      Response response= await get('https://couponava.com/wp-json/wp/v2/coupon');
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        categories =
            (body as List).map((i) => NewCoupon.fromJson(i)).toList();
        return categories;
      } else {
        return categories = List();
      }
    } else {
      return categories;
    }
  }
}
