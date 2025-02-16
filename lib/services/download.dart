import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> downloadWallpaper(String imageUrl, BuildContext context) async {
  try {
    // Request storage permission
    if (await Permission.storage.request().isGranted) {
      // Get directory path
      Directory? directory = await getExternalStorageDirectory();
      String path = "${directory!.path}/wallpaper_${DateTime.now().millisecondsSinceEpoch}.jpg";

      // Download image
      await Dio().download(imageUrl, path);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Wallpaper saved to $path")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Permission denied!")),
      );
    }
  } catch (e) {
    print("Download Error: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Download failed!")),
    );
  }
}
