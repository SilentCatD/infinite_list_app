import 'package:flutter/material.dart';
import 'package:infinite_list_app/posts/posts.dart';

class InfiniteListApp extends StatelessWidget {
  const InfiniteListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostsPage(),
    );
  }
}
