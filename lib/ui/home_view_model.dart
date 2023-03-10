import 'dart:async';

import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';

class HomeViewModel{
  final PhotoApiRepository repository;

  final _photoStremaController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStremaController.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoStremaController.add(result);
  }
}