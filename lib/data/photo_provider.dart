import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/model/photo.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;

  final _photoStremaController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStremaController.stream;

  PhotoProvider({
    Key? key,
    required this.api,
    required Widget child,
  }) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi fount in context');
    return result!;
  }

  void fetch(String query) async {
    final result = await api.fetch(query);
    _photoStremaController.add(result);
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}
