import 'package:flutter/material.dart';

import '../../data/post_model.dart';

class PostItemView extends StatelessWidget {
  const PostItemView({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.userId.toString()),
          Text(post.postId.toString()),
          Text(post.title),
          Text(post.body),
        ],
      ),
    );
  }
}
