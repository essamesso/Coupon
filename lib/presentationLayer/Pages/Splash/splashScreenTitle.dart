import 'package:flutter/material.dart';

class SplashScreenTitle extends AnimatedWidget {
  SplashScreenTitle(Animation animation) : super(listenable: animation);

  Animation get _animationLogoMovementUp => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animationLogoMovementUp.value,
      child: Column(
        children: [
          Text(
            'WELCOME TO',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          Text(
            'Couponova',
            style: TextStyle(color: Colors.black, fontSize: 35),
          ),
        ],
      ),
    );
  }
}
