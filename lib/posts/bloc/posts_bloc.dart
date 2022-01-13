import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/post_model.dart';
import '../data/posts_repository.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  late final PostsRepository _postsRepository;

  PostsBloc(PostsRepository postsRepository) : super(PostsInitial()) {
    _postsRepository = postsRepository;
    on<PostFetchRequested>(
      _onPostFetchRequested,
    );
  }

  void _onPostFetchRequested(PostFetchRequested event, Emitter emit) async {}
}
