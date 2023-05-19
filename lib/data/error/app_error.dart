import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AppError{
  final String title;
  final String description;

  const AppError({
    required this.title,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppError &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description;

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}

@immutable
class LoadError extends AppError{
  const LoadError() : super(
    title: "Load error",
    description: "Internet error"
  );

}








