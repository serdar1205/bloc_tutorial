import 'package:bloc_tutorial/data/api/api_client.dart';

class UserApi {
  ApiLoader getAll() => ApiLoader(
    path: '/users',
    loader: (path) => ApiClient().dio.get(path),
  );

}