import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_app/posts/bloc/posts_bloc.dart';

import '../../data/post_model.dart';
import 'post_item_view.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key, required this.posts, required this.loading})
      : super(key: key);
  final List<Post> posts;
  final bool loading;

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();

  void _reachBottom() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent * 0.9) {
      context.read<PostsBloc>().add(PostFetchRequested());
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_reachBottom);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.loading ? widget.posts.length + 1 : widget.posts.length,
      itemBuilder: (BuildContext context, int index) {
        if (index < widget.posts.length) {
          return PostItemView(post: widget.posts[index]);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
