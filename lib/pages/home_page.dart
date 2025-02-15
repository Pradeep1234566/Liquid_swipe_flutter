import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final pages = [
    Container(
      color: Colors.blue,
      child: Center(
        child: Text("Page 1", style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text("Page 2", style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    ),
    Container(
      color: Colors.green,
      child: Center(
        child: Text("Page 3", style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        enableLoop: true,
        slideIconWidget: Icon(Icons.arrow_back_ios, color: Colors.white),
        waveType: WaveType.liquidReveal,
      ),
    );
  }
}
