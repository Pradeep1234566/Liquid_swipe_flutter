import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final pages = [
    Container(
      color: Colors.green,
      child: Center(
        child: Image.asset('assets/images/test1.jpg'),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Image.asset('assets/images/test2.jpg'),
      ),
    ),
    Container(
      color: Colors.amber,
      child: Center(
        child: Image.asset('assets/images/test3.jpg'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        enableLoop: true,
        fullTransitionValue: 300,
        enableSideReveal: true,
        slideIconWidget: Icon(Icons.arrow_back_ios, color: Colors.white),
        waveType: WaveType.liquidReveal,
        positionSlideIcon: 0.5,
      ),
    );
  }
}
