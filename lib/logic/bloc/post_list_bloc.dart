import 'package:flutter/foundation.dart' show immutable;

import '../../data/model/post_model.dart';
import 'abstract/item_list_bloc/item_list_bloc.dart';
import 'app_error_bloc/app_error_bloc.dart';
import 'loading_bloc/loading_bloc.dart';



typedef ItemModel = PostModel;

class PostListBloc extends ItemListBloc<ItemModel> {
  PostListBloc({
    required AppErrorBloc appErrorBloc,
    required LoadingBloc loadingBloc,
  }) : super(
    appErrorBloc: appErrorBloc,
    loadingBloc: loadingBloc,
  ) {
    on<LoadUserPostsEvent>(onLoadItemList);
  }
}

@immutable
class LoadUserPostsEvent extends LoadItemListEvent<ItemModel> {
  final int userId;
  const LoadUserPostsEvent({
    required super.loader,
    required this.userId,
  });
}