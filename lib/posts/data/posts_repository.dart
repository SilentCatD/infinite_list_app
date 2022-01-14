import 'post_model.dart';
import 'posts_api.dart';

class PostsRepository {
  late final PostsAPI _postsAPI;
  late int _limit;

  PostsRepository(PostsAPI postsAPI, [int limit = 20]) {
    _postsAPI = postsAPI;
    _limit = limit;
  }

  int get limit => _limit;

  void setLimit(int limit) {
    _limit = limit;
  }

  Future<List<Post>> fetchPosts([int startIndex = 0]) async {
    try {
      final rawData = await _postsAPI.fetchPosts(startIndex, limit);
      return rawData.map((e) => Post.fromMap(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
