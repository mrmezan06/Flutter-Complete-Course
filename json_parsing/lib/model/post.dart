
// PODO : Plain Old Dart Object

class PostList{
  final List<Post> posts;
  PostList({required this.posts});
  factory PostList.fromJson(List<dynamic> parsedJson){
    List<Post> posts = List.empty(growable: true);
    posts = parsedJson.map((i) => Post.fromJson(i)).toList();
    return PostList(posts: posts); // posts[0].userId
  }
}



class Post{
  int userId;
  int id;
  String title;
  String body;

  Post({required this.userId, required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
        userId: json['userid'],
        id: json['id'],
        title: json['title'],
        body: json['body']
    );
  }
}