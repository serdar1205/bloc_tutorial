
import 'package:bloc_tutorial/data/api/photo_api.dart';
import 'package:bloc_tutorial/data/model/photo_model.dart';

import '../storage/storage.dart';

class PhotoRepository{

  Future<Iterable<PhotoModel>> getAll()async{
    final apiLoader = PhotoApi().getAll();

    final data = await Storage().getCachedOrLoad(apiLoader);

    return (data as Iterable).map<PhotoModel>((e) => PhotoModel.fromMap(e));
  }

  Future<Iterable<PhotoModel>> getForAlbum(int albumId) async{
    final apiLoader = PhotoApi().getForAlbum(albumId);

    final data = await Storage().getCachedOrLoad(apiLoader);

    return (data as Iterable).map<PhotoModel>((e) => PhotoModel.fromMap(e));
  }


}