import '../api/post_api.dart';
import '../model/post_model.dart';
import '../storage/storage.dart';

class PostRepository {
  Future<Iterable<PostModel>> getAll() async {
    final apiLoader = PostApi().getAll();

    final data = await Storage().getCachedOrLoad(apiLoader);

    return (data as Iterable).map<PostModel>((e) => PostModel.fromMap(e));
  }

  Future<Iterable<PostModel>> getForUser(int userId) async {
    final apiLoader = PostApi().getForUser(userId);

    final data = await Storage().getCachedOrLoad(apiLoader);

    return (data as Iterable).map<PostModel>((e) => PostModel.fromMap(e));
  }
}