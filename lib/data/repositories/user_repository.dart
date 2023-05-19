import '../api/user_api.dart';
import '../model/user_model.dart';
import '../storage/storage.dart';

class UserRepository {
  Future<Iterable<UserModel>> getAll() async {
    final apiLoader = UserApi().getAll();

    final data = await Storage().getCachedOrLoad(apiLoader);

    return (data as Iterable).map<UserModel>((e) => UserModel.fromMap(e));
  }
}