import 'package:copoun/DataLayer/Models/urlimagemodel.dart';
import 'package:copoun/configuration.dart';
import 'dart:convert';

import 'package:http/http.dart';
class NewCouponices {

  List<URLimageurlmodel> imageurls;

  Future<List<URLimageurlmodel>> getwcoupon() async {

    if (imageurls == null) {
      Response response= await get('https://couponava.com/wp-json/wp/v2/media/818');
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        imageurls =
            (body as List).map((i) => URLimageurlmodel.fromJson(i)).toList();
        return imageurls;
      } else {
        return imageurls = List();
      }
    } else {
      return imageurls;
    }
  }
}
