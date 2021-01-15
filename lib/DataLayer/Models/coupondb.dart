class CouponModel {
  //attributes = fields in table
  int _id;
  String _title;
  String _code;
  String _imageurl;
  String _linksite;

  CouponModel(dynamic obj) {
    _id = obj['id'];
    _title = obj['title'];
    _code = obj['code'];
    _imageurl = obj['imageurl'];
    _linksite = obj['linksite'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'code': _code,
        'imageurl': _imageurl,
        'linksite':_linksite
      };

  int get id => _id;
  String get title => _title;
  String get code => _code;
  String get imageurl => _imageurl;
  String get linksite => _linksite;
}
