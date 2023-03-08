import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_search/model/photo.dart';

class PixabayApi {
  final String baseUrl = 'https://pixabay.com/api/';
  final String apiKey = '34189223-7419d8ffbf756706c2be5edcd';

  Future<List<Photo>> fetch(String query) async {
    final response = await http
        .get(Uri.parse('$baseUrl?key=$apiKey&q=$query&image_type=photo'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
