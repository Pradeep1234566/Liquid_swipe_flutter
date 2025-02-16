import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe_tutorial/services/wallapaer.dart';

void main() {
  runApp(WallpaperApp());
}

class WallpaperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WallpaperScreen(),
    );
  }
}

class WallpaperScreen extends StatefulWidget {
  @override
  _WallpaperScreenState createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {
  List<String> wallpapers = [];

  @override
  void initState() {
    super.initState();
    fetchWallpapers();
  }

  void fetchWallpapers() async {
    try {
      List<String> images = await WallpaperService.fetchWallpapers();
      setState(() {
        wallpapers = images;
      });
    } catch (e) {
      print("Error fetching wallpapers: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wallpapers.isEmpty
          ? Center(
              child: CircularProgressIndicator()) // Show loader while fetching
          : LiquidSwipe(
              pages: wallpapers.map((url) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              fullTransitionValue: 600,
              enableLoop: true,
              waveType: WaveType.liquidReveal,
            ),
    );
  }
}
