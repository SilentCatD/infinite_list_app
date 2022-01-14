class Post {
  late final int userId;
  late final int postId;
  late final String title;
  late final String body;

  Post({
    required this.title,
    required this.body,
    required this.userId,
    required this.postId,
  });

  Post.fromMap(Map<String, dynamic> data) {
    title = data['title'];
    body = data['body'];
    userId = data['userId'];
    postId = data['id'];
  }
}
