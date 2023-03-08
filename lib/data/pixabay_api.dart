import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_search/model/photo.dart';

import 'photo_api_repository.dart';

class PixabayApi implements PhotoApiRepository {
  static const String baseUrl = 'https://pixabay.com/api/';
  static const String apiKey = '34189223-7419d8ffbf756706c2be5edcd';

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    client ??= http.Client();

    final response = await client
        .get(Uri.parse('$baseUrl?key=$apiKey&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
