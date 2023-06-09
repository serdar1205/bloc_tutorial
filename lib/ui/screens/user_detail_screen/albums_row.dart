import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../data/model/album_model.dart';
import '../../../data/model/user_model.dart';
import '../../../logic/bloc/abstract/item_list_bloc/item_list_bloc.dart';
import '../../../logic/bloc/album_list_bloc.dart';
import '../../cards/album_card.dart';
import '../user_albums_screen.dart';

class AlbumsRow extends StatelessWidget {
  const AlbumsRow({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Albums:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          BlocBuilder<AlbumListBloc, ItemListState<AlbumModel>>(
            builder: (context, state) {
              return SizedBox(
                height: 200,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...state.list.take(3).map((e) => AlbumCard(e)).toList(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserAlbumsScreen(user: user),
                            ),
                          );
                        },
                        child: const Text("More..."),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
