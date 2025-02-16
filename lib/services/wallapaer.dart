import 'dart:convert';
import 'package:http/http.dart' as http;

class WallpaperService {
  static const String apiKey = "Ah2GhDTknMmeb4Xll7XrDvWh4rXJHv5iLhHK8WR9rOoJhFKwa3eUxnlE";
  static const String apiUrl = "https://api.pexels.com/v1/curated?per_page=20";

  static Future<List<Map<String, String>>> fetchWallpapers() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {"Authorization": apiKey},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Map<String, String>> wallpapers = [];

      for (var photo in data["photos"]) {
        wallpapers.add({
          "imageUrl": photo["src"]["portrait"],
          "photographer": photo["photographer"],
        });
      }

      return wallpapers;
    } else {
      throw Exception("Failed to fetch wallpapers");
    }
  }
}
