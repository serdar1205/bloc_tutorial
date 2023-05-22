import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/post_model.dart';
import '../../data/model/user_model.dart';
import '../../logic/bloc/abstract/item_list_bloc/item_list_bloc.dart';
import '../../logic/bloc/post_list_bloc.dart';
import '../cards/post_card.dart';


class UserPostsScreen extends StatelessWidget {
  final UserModel user;
  const UserPostsScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts of user: ${user.username}"),
      ),
      body: BlocBuilder<PostListBloc, ItemListState<PostModel>>(
        builder: (context, state) {
          final posts =
              state.list.where((post) => user.id == post.userId).toList();

          return ListView.builder(
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostCard(post);
            },
            itemCount: posts.length,
          );
        },
      ),
    );
  }
}
