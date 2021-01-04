import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



String api_url="https://couponava.com/wp-json/wp/v2/coupon";

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

const Map icons={
  'cart_icon': 'assets/images/shop.png',
  'back_icon':'assets/images/back.png',
   'point_map': 'assets/images/Misc-Elements-Map Pin.png',
    'delete_icon':'assets/images/delete.png',
  'icon_rectangle':'assets/images/icon_rectangle.png',
  'map_image': 'assets/images/Rectangle.png',
  'notification_icon':Icon(Icons.notifications_none_outlined),
  'search_iconR': 'assets/images/search_itemRight.png',
  'search_iconL' : 'assets/images/search_itemLeft.png',
  'Favourite_icon' : Icon(Icons.favorite),
};

List<Map> categories = [
  {'name': 'Noon', 'iconPath': 'assets/images/noon.jpg'},
  {'name': 'AliExpress', 'iconPath': 'assets/images/souq.png'},
  {'name': 'Ebay', 'iconPath': 'assets/images/h&m.png'},
  {'name': 'iHerb', 'iconPath': 'assets/images/az.jpg'},
  {'name': 'Amazon', 'iconPath': 'assets/images/nashry.png'},
  {'name': 'H&M', 'iconPath': 'assets/images/souq.png'},
{'name': 'Noon', 'iconPath': 'assets/images/noon.jpg'},
  {'name': 'AliExpress', 'iconPath': 'assets/images/souq.png'},
  {'name': 'Ebay', 'iconPath': 'assets/images/h&m.png'},
  {'name': 'iHerb', 'iconPath': 'assets/images/az.jpg'},
  {'name': 'Amazon', 'iconPath': 'assets/images/nashry.png'},
  {'name': 'H&M', 'iconPath': 'assets/images/souq.png'},
  {'name': 'Noon', 'iconPath': 'assets/images/noon.jpg'},
  {'name': 'AliExpress', 'iconPath': 'assets/images/souq.png'},
  {'name': 'Ebay', 'iconPath': 'assets/images/h&m.png'},
  {'name': 'iHerb', 'iconPath': 'assets/images/az.jpg'},
  {'name': 'Amazon', 'iconPath': 'assets/images/nashry.png'},
];

List<Map> drawerItems=[
  {
    'icon': FontAwesomeIcons.paw,
    'title' : 'Adoption'
  },
  {
    'icon': Icons.mail,
    'title' : 'Donation'
  },
  {
    'icon': FontAwesomeIcons.plus,
    'title' : 'Add pet'
  },
  {
    'icon': Icons.favorite,
    'title' : 'Favorites'
  },
  {
    'icon': Icons.mail,
    'title' : 'Messages'
  },
  {
    'icon': FontAwesomeIcons.userAlt,
    'title' : 'Profile'
  },
];