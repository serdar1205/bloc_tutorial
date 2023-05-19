import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'dart:convert';

@immutable
class PostModel extends Equatable {
  @override
  List<Object> get props => [userId, id, title, body];

  @override
  String toString() {
    return 'PostModel{userId: $userId, id: $id, title: $title, body: $body}';
  }

  final int userId;
  final int id;
  final String title;
  final String body;

  const PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(String str) => PostModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
