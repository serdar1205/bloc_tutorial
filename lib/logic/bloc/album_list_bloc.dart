import 'package:bloc_tutorial/data/model/album_model.dart';
import 'package:bloc_tutorial/data/repositories/photo_repository.dart';
import 'package:bloc_tutorial/logic/bloc/abstract/item_list_bloc/item_list_bloc.dart';
import 'package:bloc_tutorial/logic/bloc/app_error_bloc/app_error_bloc.dart';
import 'package:bloc_tutorial/logic/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'photo_list_bloc.dart';

typedef ItemModel = AlbumModel;

class AlbumListBloc extends ItemListBloc<ItemModel> {
  final PhotoListBloc photoListBloc;

  AlbumListBloc({
    required this.photoListBloc,
    required AppErrorBloc appErrorBloc,
    required LoadingBloc loadingBloc,
  }) : super(
          appErrorBloc: appErrorBloc,
          loadingBloc: loadingBloc,
        ) {
    on<LoadUserAlbumEvent>((event, emit) async {
      await onLoadItemList(event, emit);

      for (var album in state.list) {
        photoListBloc.add(LoadAlbumPhotosEvent(
            loader: () => PhotoRepository().getForAlbum(album.id),
            albumId: album.id));
      }
    });
  }
}

@immutable
class LoadUserAlbumEvent extends LoadItemListEvent<ItemModel> {
  final int userId;

  const LoadUserAlbumEvent({required this.userId, required super.loader});
}
