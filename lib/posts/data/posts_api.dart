import 'dart:convert';

import 'package:http/http.dart' as http;

class PostsAPI {
  Future<List<Map<String, dynamic>>> fetchPosts(int startIndex, int limit) async {
    final url = Uri.http('jsonplaceholder.typicode.com', '/posts',
        {'_start': '$startIndex', '_limit': '$limit'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body) as List;
      return results.map((e) => e as Map<String, dynamic>).toList();
    }
    throw Exception("error fetching posts");
  }
}


