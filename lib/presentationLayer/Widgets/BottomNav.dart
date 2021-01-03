import 'package:copoun/presentationLayer/Widgets/BNBCustomPainter.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 1,
      child: Container(
        width: size.width,
        height: 60,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 60),
              painter: BNBCustomPainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.orange,
                child: Icon(Icons.home),
                elevation: 0.1,
              ),
            ),
            Container(
              width: size.width,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.restaurant_menu),
                    onPressed: () {},
                  ),
                  Container(
                    width: size.width * 0.20,
                  ),
                  IconButton(
                    icon: Icon(Icons.bookmark),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
