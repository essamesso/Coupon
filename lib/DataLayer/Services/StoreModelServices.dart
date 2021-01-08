import 'package:copoun/DataLayer/Models/StoreModel.dart';
import 'dart:convert';

import 'package:http/http.dart';

class StoreModelServices {
  List<StoreModel> store;
  
  Future<List<StoreModel>> getStoreModel() async {
    if (store == null) {
      Response response = await get("https://couponava.com/wp-json/wp/v2/store");
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        store = (body as List).map((i) => StoreModel.fromJson(i)).toList();
        return store;
      } else {
        return store = List();
      }
    } else {
      return store;
    }
  }

}
