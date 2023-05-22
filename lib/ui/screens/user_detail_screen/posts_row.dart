import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/post_model.dart';
import '../../../data/model/user_model.dart';
import '../../../logic/bloc/abstract/item_list_bloc/item_list_bloc.dart';
import '../../../logic/bloc/post_list_bloc.dart';
import '../../cards/post_card.dart';
import '../user_posts_screen.dart';

class PostsRow extends StatelessWidget {
  const PostsRow({
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
              "Posts:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          BlocBuilder<PostListBloc, ItemListState<PostModel>>(
            builder: (context, state) {
              return Column(
                children: [
                  ...state.list.take(3).map((e) => PostCard(e)).toList(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserPostsScreen(user: user),
                          ),
                        );
                      },
                      child: const Text("More..."),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
