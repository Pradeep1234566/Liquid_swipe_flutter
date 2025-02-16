import 'dart:convert';
import 'package:http/http.dart' as http;

class WallpaperService {
  static const String _apiKey = "Ah2GhDTknMmeb4Xll7XrDvWh4rXJHv5iLhHK8WR9rOoJhFKwa3eUxnlE";  // Replace with your new API key
  static const String _baseUrl = "https://api.pexels.com/v1/search?query=wallpapers";

  static Future<List<String>> fetchWallpapers() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        "Authorization": _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<String> imageUrls = [];

      for (var photo in data['photos']) {
        imageUrls.add(photo['src']['portrait']); // Get portrait image URLs
      }

      return imageUrls;
    } else {
      throw Exception("Failed to load wallpapers");
    }
  }
}
