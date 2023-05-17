import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'dart:convert';

@immutable
class AlbumModel extends Equatable {
  final int userId;
  final int id;
  final String title;

  const AlbumModel(
      {required this.userId, required this.id, required this.title});

  @override
  List<Object?> get props => [userId, id, title];

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
    };
  }

  factory AlbumModel.fromMap(Map<String, dynamic> map) {
    return AlbumModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AlbumModel{userId: $userId, id: $id, title: $title}';
  }
}
