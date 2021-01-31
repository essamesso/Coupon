import 'package:copoun/DataLayer/Provider/coupon_provider.dart';
import 'package:copoun/presentationLayer/Pages/everystorecoupon/everystorecoupon_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CouponProvider providercoupons = Provider.of<CouponProvider>(context);
    var size = MediaQuery.of(context).size;
    return providercoupons.store.isEmpty
        ? SizedBox.shrink()
        : Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        child: Hero(
                          tag: providercoupons.store[index].name,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                providercoupons.store[index].image),
                            backgroundColor: Theme.of(context).hintColor,
                          ),
                        ),
                        onTap: () {
                          //____________________ on tap
                          var id = providercoupons.store[index].id;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EveryStoreCoupon(
                                      id: id,
                                      title: providercoupons.store[index].name,
                                      image:
                                          providercoupons.store[index].image)));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 100,
                      child: Center(
                        child: Text(
                          providercoupons.store[index].name,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: size.width * .03,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          );
  }
}
