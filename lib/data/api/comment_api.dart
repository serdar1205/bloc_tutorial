import 'package:bloc_tutorial/data/api/api_client.dart';

class CommentApi {
  ApiLoader getAll() => ApiLoader(
        path: '/comments',
        loader: (path) => ApiClient().dio.get(path),
      );

  ApiLoader getForPost(int postId) => ApiLoader(
        path: "/post/$postId/comments",
        loader: (path) => ApiClient().dio.get(path),
      );

  ApiLoader create(data) => ApiLoader(
        path: "/comments",
        loader: (path) => ApiClient().dio.post(path, data: data),
      );
}
