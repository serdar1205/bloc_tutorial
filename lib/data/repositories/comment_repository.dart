import 'package:bloc_tutorial/data/api/comment_api.dart';
import 'package:bloc_tutorial/data/model/comment_model.dart';

import '../storage/storage.dart';

class CommentRepository{

  Future<Iterable<CommentModel>> getAll() async{

    final apiLoader = CommentApi().getAll();

    final data = await Storage().getCachedOrLoad(apiLoader);

    return (data as Iterable).map<CommentModel>((e) => CommentModel.fromMap(e));
  }

  Future<CommentModel> create(CommentModel commentModel)async{
    final apiLoader = CommentApi().create(commentModel.toMap());

    final data = await Storage().getCachedOrLoad(apiLoader);

    return CommentModel.fromMap(data);
  }

  Future<Iterable<CommentModel>> getForPost(int postId) async{
    final apiLoader = CommentApi().getForPost(postId);

    final data = await Storage().getCachedOrLoad(apiLoader);

    return (data as Iterable).map<CommentModel>((e) => CommentModel.fromMap(e));
  }





}