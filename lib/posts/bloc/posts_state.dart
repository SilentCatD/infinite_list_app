part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostFetchInProgress extends PostsState{
  final List<Post> posts;
  PostFetchInProgress(this.posts);
}

class PostFetchComplete extends PostsState{
  final List<Post> posts;
  PostFetchComplete(this.posts);
}

class PostFetchFailure extends PostsState{}