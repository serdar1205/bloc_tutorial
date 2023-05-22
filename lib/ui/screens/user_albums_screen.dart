import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/album_model.dart';
import '../../data/model/user_model.dart';
import '../../logic/bloc/abstract/item_list_bloc/item_list_bloc.dart';
import '../../logic/bloc/album_list_bloc.dart';
import '../cards/album_card.dart';
import '../responsive.dart';

class UserAlbumsScreen extends StatelessWidget {
  final UserModel user;
  const UserAlbumsScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Albums of user: ${user.username}"),
      ),
      body: BlocBuilder<AlbumListBloc, ItemListState<AlbumModel>>(
        builder: (context, state) {
          final albums = state.list.where((album) => user.id == album.userId);

          return GridView.count(
            crossAxisCount: Responsive.getValue<int>(context, 1, 2, 3, 5),
            children: albums.map<Widget>((e) => AlbumCard(e)).toList(),
          );
        },
      ),
    );
  }
}
