import 'package:bloc_tutorial/data/error/app_error.dart';
import 'package:bloc_tutorial/logic/bloc/abstract/item_list_bloc/item_list_bloc.dart';
import 'package:bloc_tutorial/logic/bloc/app_error_bloc/app_error_bloc.dart';
import 'package:bloc_tutorial/logic/bloc/loading_bloc/loading_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show immutable;
import '../../data/model/comment_model.dart';

typedef ItemModel = CommentModel;

class CommentListBloc extends ItemListBloc<ItemModel> {
  CommentListBloc({
    required AppErrorBloc appErrorBloc,
    required LoadingBloc loadingBloc,
  }) : super(
          appErrorBloc: appErrorBloc,
          loadingBloc: loadingBloc,
        ) {
    on<LoadPostCommentEvent>(onLoadItemList);

    on<CreatePostCommentEvent>((event, emit) async {
      try {
        loadingBloc.add(const StartLoadingEvent());

        await event.loader();

        loadingBloc.add(const StopLoadingEvent());
      } on DioError catch (_) {
        loadingBloc.add(const StopLoadingEvent());
        appErrorBloc.add(const AppErrorAddEvent(LoadError()));
      } catch (_) {
        loadingBloc.add(const StopLoadingEvent());
        appErrorBloc.add(const AppErrorAddEvent(LoadError()));
      }
    });
  }
}

@immutable
class LoadPostCommentEvent extends LoadItemListEvent<ItemModel> {
  final int postId;

  const LoadPostCommentEvent({required this.postId, required super.loader});
}

@immutable
class CreatePostCommentEvent extends ItemListEvent<ItemModel> {
  final Future<void> Function() loader;

  const CreatePostCommentEvent({
    required this.loader,
  });
}
