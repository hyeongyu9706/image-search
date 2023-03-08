import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/home_view_model.dart';

void main() {
  test('Stream 동작', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());

    await viewModel.fetch('apple');
    await viewModel.fetch('apple');

    final result=fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(
        viewModel.photoStream,
        emitsInOrder([
          equals([]),
          equals(result),
          equals(result),
        ]));
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(microseconds: 500));
    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 2295434,
    "pageURL":
        "https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/",
    "type": "photo",
    "tags": "spring bird, bird, tit",
    "previewURL":
        "https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g02d933285248be36eb630f0684b56cdf508d6a8c539ae2b31415037fa67bf9895d56b727c80217c32aaab5da39c49590ef1d1aba81656a4384d9ec2c3b0daa75_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/ge9b0dee57a46ac26cf63ff3658e3d43b9a50443cbaca22c6764ee8eadaf55b01a60c5cbe74a401b5e1d40b87c90cfedd8b2ec0326f9cd9d37e66f8cdd027597f_1280.jpg",
    "imageWidth": 5363,
    "imageHeight": 3575,
    "imageSize": 2938651,
    "views": 651834,
    "downloads": 378147,
    "collections": 2111,
    "likes": 2013,
    "comments": 255,
    "user_id": 334088,
    "user": "JillWellington",
    "userImageURL":
        "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
  },
  {
    "id": 3063284,
    "pageURL":
        "https://pixabay.com/photos/rose-flower-petal-floral-noble-3063284/",
    "type": "photo",
    "tags": "rose, flower, petal",
    "previewURL":
        "https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g47c2f8ef0dd95e07c942e2265c7d1a40d4711da65f02ccbf3e85dff464332884b4aa4e8087a99f96be116da7ff5af03a0f7f59ca375b180377a41ce9d8eb6de7_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g022076c3d92c67660c5f2ff893098b58fb15f1ac7dc8a73e610a1839b114187679045a31bacc65cc01e51bf7bbef3a8497126ba20e89852e82a40d2960891f76_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 3574625,
    "views": 1059266,
    "downloads": 684237,
    "collections": 1417,
    "likes": 1537,
    "comments": 329,
    "user_id": 1564471,
    "user": "anncapictures",
    "userImageURL":
        "https://cdn.pixabay.com/user/2015/11/27/06-58-54-609_250x250.jpg"
  },
];
