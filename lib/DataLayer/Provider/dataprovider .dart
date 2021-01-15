import 'package:copoun/DataLayer/Models/coupondb.dart';
import 'package:flutter/foundation.dart';
import 'dbhelper .dart';

class DataProvider with ChangeNotifier {
  final DBHelper dbHelper;

  List<CouponModel> _items = [];
  List<CouponModel> get items => _items;

  List _ids = [];
  List get ids => _ids;

  set ids(List ids) {
    _ids = ids;
    notifyListeners();
  }

  final tableName = 'bookmarktable';

  DataProvider(this._items, this.dbHelper) {
    if (dbHelper != null){
      fetchAndSetData();}
  }

  void addcoupon(dynamic item) {
    if (dbHelper.db != null) {
      // do not execute if db is not instantiate
      final newcoupon = CouponModel(item);
      _items.add(newcoupon);
      notifyListeners();
      dbHelper.insert(tableName, {
        'id': newcoupon.id,
        'title': newcoupon.title,
        'code': newcoupon.code,
        'imageurl': newcoupon.imageurl,
        'linksite': newcoupon.linksite,
      });
    }
  }

  void delletcoupon(int id) {
    if (dbHelper.db != null) {
      dbHelper.deleteCoupon(id);
      notifyListeners();
      fetchAndSetData();
    }
  }

  Future<void> fetchAndSetData() async {
    if (dbHelper.db != null) {
      // do not execute if db is not instantiate
      final dataList = await dbHelper.getData(tableName);
      _items = dataList.map((item) => CouponModel(item)).toList();
      notifyListeners();
    }
  }


  /* List  getids() {
    if(items!=null){
    for (int i = 0; i < items.length; i++) {
      ids.add(items[i].id);
    }
    
    return ids;
    }
    return ids;
  }*/

}
