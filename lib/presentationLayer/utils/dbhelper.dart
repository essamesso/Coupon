import 'package:copoun/DataLayer/Models/coupondb.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;

  DbHelper.internal();
  static Database _db;

  Future<Database> createDatabase() async{
    if(_db != null){
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'coupon.db');
    _db = await openDatabase(path,version: 1, onCreate: (Database db, int v){
      //create tables
      db.execute('create table favouritecoupon(id integer primary key autoincrement, title varchar(100), code varchar(100), imageurl varchar(100), linksite varchar(100))');
      
    });
    return _db;
  }


  Future<int> createCoupon(CouponModel coupon) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses value')
    return db.insert('favouritecoupon', coupon.toMap());
  }


  Future<List> allCoupon() async{
    Database db = await createDatabase();
    //db.rawQuery('select * from courses');
     return await db.query('favouritecoupon');
  }

  Future<int> deleteCoupon(int id) async{
    Database db = await createDatabase();
    return db.delete('favouritecoupon', where: 'id = ?', whereArgs: [id]);
  }
 /* Future<int> courseUpdate(Course course) async{
    Database db = await createDatabase();
    return await db.update('courses', course.toMap(),where: 'id = ?', whereArgs: [course.id]);
  }*/
}