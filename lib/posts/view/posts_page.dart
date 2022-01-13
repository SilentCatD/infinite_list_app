import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/posts_bloc.dart';
import '../data/posts_repository.dart';
import '../data/posts_api.dart';
import 'posts_view.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postsRepository = PostsRepository(PostsAPI());
    return BlocProvider(
      create: (context) => PostsBloc(postsRepository),
      child: const PostsView(),
    );
  }
}
