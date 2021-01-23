import 'package:copoun/configuration.dart';
import 'package:copoun/presentationLayer/Widgets/categoryCardStores.dart';
import 'package:flutter/material.dart';

class Stores extends StatefulWidget {
  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal:8,vertical: 20 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   IconButton(
                     icon: Image.asset(icons['cart_icon'],width: 35,height: 35,),
                     onPressed: (){
                     },
                   ),
                  Text(
                    "المتاجر",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  IconButton(
                      icon:Image.asset(icons['back_icon'],height: 35,width: 35),
                        onPressed:(){
                          Navigator.pop(context);
                        } ,
                      ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(top:8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 20,
                    ),
                physics: ClampingScrollPhysics(),
                itemCount: 17,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return CategoryCardStores(
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}
