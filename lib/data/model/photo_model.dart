import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'dart:convert';

@immutable
class PhotoModel extends Equatable {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoModel.fromMap(Map<String, dynamic> json) => PhotoModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toMap() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };



  @override
  List<Object> get props => [albumId, id, title, url, thumbnailUrl];

  factory PhotoModel.fromJson(String str) =>
      PhotoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'PhotoModel{albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl}';
  }

}
