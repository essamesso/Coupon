
import 'dart:convert';
import 'package:copoun/DataLayer/Models/EveryStoreCouponModel.dart';
import 'package:http/http.dart';
import '../../configuration.dart';

class EveryCouponinStore{
  List<EveryStoreCouponModel> everycouponinstore;
  Future<List<EveryStoreCouponModel>> geteverycouponinstore(int id) async {
    if (everycouponinstore == null) {
      Response response = await get('https://couponava.com/wp-json/wp/v2/coupon?store=${id.toString()}');
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        everycouponinstore = (body as List).map((i) => EveryStoreCouponModel.fromJson(i)).toList();
        return everycouponinstore;
      } else {
        return everycouponinstore = List();
      }
    } else {
      return everycouponinstore;
    }
  }

}