import 'package:copoun/DataLayer/Models/NewCouponmodel.dart';
import 'package:copoun/configuration.dart';
import 'dart:convert';

import 'package:http/http.dart';

class NewCouponServices {
  List<NewCoupon> categories;

  Future<List<NewCoupon>> getnewcoupon() async {
    if (categories == null) {
      Response response = await get(apiurl);
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        categories = (body as List).map((i) => NewCoupon.fromJson(i)).toList();
        return categories;
      } else {
        //TODO handel error
        return categories = List();
      }
    } else {
      return categories;
    }
  }
}
