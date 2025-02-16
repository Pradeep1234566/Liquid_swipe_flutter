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
  List<Map<String, String>> wallpapers = [];

  @override
  void initState() {
    super.initState();
    fetchWallpapers();
  }

  void fetchWallpapers() async {
    try {
      List<Map<String, String>> images =
          await WallpaperService.fetchWallpapers();
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
          ? Center(child: CircularProgressIndicator())
          : LiquidSwipe(
              pages: wallpapers.map((wallpaper) {
                return Stack(
                  children: [
                    // Wallpaper Background
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(wallpaper["imageUrl"]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Dark Overlay for Readability
                    Container(
                      color: Colors.black.withOpacity(0.3),
                    ),

                    // Wallpaper Info (Photographer & Source)
                    Positioned(
                      bottom: 120,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            wallpaper["photographer"]!, // Photographer name
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Source: Pexels",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Floating Action Buttons (Set Wallpaper & Download)
                    Positioned(
                      bottom: 40,
                      right: 20,
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              // Implement "Set as Wallpaper"
                            },
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.wallpaper, color: Colors.white),
                          ),
                          SizedBox(width: 15),
                          FloatingActionButton(
                            onPressed: () {
                              // Implement "Download Wallpaper"
                            },
                            backgroundColor: Colors.green,
                            child: Icon(Icons.download, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
              fullTransitionValue: 400,
              enableLoop: true,
              waveType: WaveType.circularReveal,
              enableSideReveal: true,
            ),
    );
  }
}
