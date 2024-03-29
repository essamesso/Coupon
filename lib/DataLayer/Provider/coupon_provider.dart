import 'package:copoun/DataLayer/Models/NewCouponmodel.dart';
import 'package:copoun/DataLayer/Models/StoreModel.dart';
import 'package:copoun/DataLayer/Services/StoreModelServices.dart';
import 'package:copoun/DataLayer/Services/newcouponservices.dart';
import 'package:flutter/cupertino.dart';

class CouponProvider with ChangeNotifier {

  bool _showprogress=true;
  bool get showprogress => _showprogress;
  set showprogress(bool showprogress) {
    _showprogress = showprogress;
    notifyListeners();
  }
  List<StoreModel> _store = new List<StoreModel>();
  List<NewCoupon> _coupon = new List<NewCoupon>();


  List<StoreModel> get store => _store;

  set store(List<StoreModel> store) {
    _store = store;
    notifyListeners();
  }
  
  NewCouponServices couponapi = NewCouponServices();
  StoreModelServices storesapi = StoreModelServices();

CouponProvider(){
  fetchstores();
  fetchCoupon();
}
  List<NewCoupon> get coupon => _coupon;

  set coupon(List<NewCoupon> coupon) {
    _coupon = coupon;
    notifyListeners();
  }

  Future<List<NewCoupon>> fetchCoupon() async {
    coupon = await couponapi.getnewcoupon();
    if(coupon!=null)
      _showprogress=false;
    return coupon;
  }
  Future<List<StoreModel>> fetchstores() async {
    store = await storesapi.getStoreModel();
    return store;
  }
}
