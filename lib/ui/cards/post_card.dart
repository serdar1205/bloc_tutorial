

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/post_model.dart';
import '../../data/repositories/comment_repository.dart';
import '../../logic/bloc/comment_list_bloc.dart';
import '../constants.dart';
import '../screens/post_detail_screen/post_detail_screen.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  const PostCard(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: kDefaultPadding,
          child: ListTile(
            onTap: () {
              context.read<CommentListBloc>().add(
                LoadPostCommentEvent(
                  loader: () => CommentRepository().getForPost(post.id),
                  postId: post.id,
                ),
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailScreen(post: post),
                ),
              );
            },
            title: Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              post.body.split("\n").first,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
