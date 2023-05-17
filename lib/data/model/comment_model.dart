import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'dart:convert';

@immutable
class CommentModel extends Equatable {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  List<Object> get props => [postId, id, name, email, body];

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      postId: map['postId'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      body: map['body'] as String,
    );
  }

  factory CommentModel.fromJson(String string) {
    return CommentModel.fromMap(json.decode(string));
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'CommentModel{postId: $postId, id: $id, name: $name, email: $email, body: $body}';
  }
}
