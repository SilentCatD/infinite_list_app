import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/post_model.dart';
import '../data/posts_repository.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  late final PostsRepository _postsRepository;
  int _lastIndex = 0;

  PostsBloc(PostsRepository postsRepository) : super(PostsInitial()) {
    _postsRepository = postsRepository;
    on<PostFetchRequested>(
      _onPostFetchRequested,
    );
  }

  void _onPostFetchRequested(PostFetchRequested event, Emitter emit) async {
    try {
      if (state is PostFetchComplete) {
        emit(PostFetchInProgress((state as PostFetchComplete).posts));
      } else {
        emit(PostFetchInProgress(const []));
      }
      final posts = await _postsRepository.fetchPosts(_lastIndex);
      _lastIndex = posts.length;
      emit(PostFetchComplete(posts));
    } catch (e) {
      emit(PostFetchFailure());
    }
  }
}
