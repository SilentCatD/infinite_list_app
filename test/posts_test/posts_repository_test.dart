import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_list_app/posts/data/post_model.dart';
import 'package:infinite_list_app/posts/data/posts_api.dart';
import 'package:infinite_list_app/posts/data/posts_repository.dart';

void main() {
  group("posts repository test", () {
    late final PostsAPI postsAPI;
    late final PostsRepository postsRepository;
    setUp(() {
      postsAPI = PostsAPI();
      postsRepository = PostsRepository(postsAPI);
    });

    test("return type of fetch is List<Posts>", () async {
      final results = await postsRepository.fetchPosts();
      expect(results, isA<List<Post>>());
    });
  });
}
