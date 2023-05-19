import 'package:dio/dio.dart';

final localhostOptions = BaseOptions(
  baseUrl: "https://jsonplaceholder.typicode.com",
  // connectTimeout: Duration(seconds: 5),
  //receiveTimeout: Duration(seconds: 3),
  //sendTimeout: const Duration(seconds: 3)
);

/// singleton
class ApiClient {
  late final Dio dio;

  ApiClient._instance() : dio = Dio(localhostOptions);
  static final ApiClient _apiClient = ApiClient._instance();

  factory ApiClient() => _apiClient;
}

class ApiLoader {
  final String path;
  /// future type - ly responce clasy alyan function --- variable
  late Future<Response> Function() loader;

  ApiLoader({
    required this.path,
    required Future<Response> Function(String path) loader,
  }) {
    this.loader = () => loader(path);
  }
}
