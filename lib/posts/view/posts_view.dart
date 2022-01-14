import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_app/posts/view/widgets/post_item_view.dart';

import 'widgets/posts_list.dart';
import '../bloc/posts_bloc.dart';

class PostsView extends StatefulWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostFetchInProgress) {
            if (state.posts.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return PostsList(posts: state.posts, loading: true);
          }
          if (state is PostFetchFailure) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is PostFetchComplete) {
            if (state.posts.isEmpty) {
              return const Center(
                child: Text("There are no posts"),
              );
            }
            return PostsList(posts: state.posts, loading: false);
          }
          throw (UnimplementedError());
        },
      ),
    );
  }
}
