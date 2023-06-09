import 'package:flutter/foundation.dart' show immutable;

import '../../data/model/user_model.dart';
import 'abstract/item_list_bloc/item_list_bloc.dart';
import 'app_error_bloc/app_error_bloc.dart';
import 'loading_bloc/loading_bloc.dart';

typedef ItemModel = UserModel;

class UserListBloc extends ItemListBloc<ItemModel> {
  UserListBloc({
    required AppErrorBloc appErrorBloc,
    required LoadingBloc loadingBloc,
  }) : super(
    appErrorBloc: appErrorBloc,
    loadingBloc: loadingBloc,
  ) {
    on<LoadUsersEvent>(onLoadItemList);
  }
}

@immutable
class LoadUsersEvent extends LoadItemListEvent<ItemModel> {
  const LoadUsersEvent({required super.loader});
}