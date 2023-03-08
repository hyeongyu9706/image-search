import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo extends Equatable {
  final int id;
  final String tags;

  @JsonKey(name: 'previewURL')
  final String previewUrl;

  const Photo({
    required this.id,
    required this.tags,
    required this.previewUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  List<Object?> get props => [id];
}


// import 'package:json_annotation/json_annotation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'photo.freezed.dard';
//
// part 'photo.g.dart';
//
// @freezed
// class Photo with _$Photo{
//   factory Photo({
//     required int id,
//     required String tags,
//     required  String previewUrl,
// }) = _Photo;
//   factory Photo.fromJson(Map<String,dynamic> json)=>_$PhotoFromJson(json);
// }