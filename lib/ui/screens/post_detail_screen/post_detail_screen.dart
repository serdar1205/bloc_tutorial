// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../data/model/photo_model.dart';
import '../../../data/model/post_model.dart';
import '../../../logic/bloc/abstract/item_list_bloc/item_list_bloc.dart';
import '../../../logic/bloc/photo_list_bloc.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'comment_form.dart';
import 'comment_list.dart';
import 'post_details.dart';

class PostDetailScreen extends StatelessWidget {
  final PostModel post;
  const PostDetailScreen({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post detail: ${post.title}"),
      ),
      floatingActionButton:
          (Responsive.isMobile(context) || Responsive.isSmallMobile(context))
              ? FloatingActionButton(
                  onPressed: (() {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return CommentForm(post.id);
                      },
                    );
                  }),
                  child: const Icon(Icons.comment),
                )
              : null,
      body: SingleChildScrollView(
        child: BlocBuilder<PhotoListBloc, ItemListState<PhotoModel>>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        PostDetails(post: post),
                        const SizedBox(height: kDefaultPadding),
                        if (Responsive.isTablet(context) ||
                            Responsive.isDesktop(context)) ...[
                          CommentForm(post.id),
                          const SizedBox(height: kDefaultPadding),
                        ],
                        if (!Responsive.isDesktop(context)) CommentList(post)
                      ],
                    ),
                  ),
                  const SizedBox(width: kDefaultPadding),
                  if (Responsive.isDesktop(context))
                    Expanded(
                      flex: 3,
                      child: CommentList(post),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
