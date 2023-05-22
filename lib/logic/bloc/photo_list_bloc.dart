import 'package:bloc_tutorial/data/model/photo_model.dart';
import 'package:bloc_tutorial/logic/bloc/abstract/item_list_bloc/item_list_bloc.dart';
import 'package:bloc_tutorial/logic/bloc/app_error_bloc/app_error_bloc.dart';
import 'package:bloc_tutorial/logic/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

typedef ItemModel = PhotoModel;

class PhotoListBloc extends ItemListBloc<ItemModel> {
  PhotoListBloc(
      {required AppErrorBloc appErrorBloc, required LoadingBloc loadingBloc})
      : super(
          appErrorBloc: appErrorBloc,
          loadingBloc: loadingBloc,
        ) {
    on<LoadAlbumPhotosEvent>(onLoadItemList);
  }
}

@immutable
class LoadAlbumPhotosEvent extends LoadItemListEvent<ItemModel> {
  final int albumId;
  const LoadAlbumPhotosEvent({
    required super.loader,
    required this.albumId,
  });
}
