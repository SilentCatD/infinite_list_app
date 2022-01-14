import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_list_app/posts/data/posts_api.dart';

void main() {
  group("posts api uni tests", (){
    late PostsAPI postsAPI;
    setUp(() {
        postsAPI = PostsAPI();
    });
    tearDown((){

    });

    test("return type is List<Map<String, dynamic>>", () async {
      final results = await postsAPI.fetchPosts(0, 1);
      expect(results, isA<List<Map<String, dynamic>>>());
    });

    test("type of each element in Map<String, dynamic>", () async {
      final results = await postsAPI.fetchPosts(0, 1);
      final oneElement = results.first;
      expect(oneElement, containsPair('title', isA<String>()));
      expect(oneElement, containsPair('body', isA<String>()));
      expect(oneElement, containsPair('userId', isA<int>()));
      expect(oneElement, containsPair('id', isA<int>()));
    });

  });
}
