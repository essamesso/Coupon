import 'package:flutter/material.dart';

import '../../../configuration.dart';
import 'componants/listviewcoupon.dart';
class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Column(children: [
               Container(
                  height: 60,
                  margin: EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: InkWell(
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                      categories[index]['iconPath'],
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                            //  Text(categories[index]['name'])
                          ],
                        ),
                      );
                    },
                  ),
                ),
                CreateListView()
            ],
      ),
    );
  }
}