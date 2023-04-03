import 'package:dio/dio.dart';
import 'package:http_app/post.dart';

class PostRepository {
  final dio = Dio();

  static PostRepository _instance = PostRepository._single();

  PostRepository._single();
  factory PostRepository(){
    return _instance;
  }

  Future<Post> findById(int id) async {
    Response response = await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
    Post post = Post.fromJson(response.data);
    return post;
  }

  Future<List<Post>> findAll() async {
    Response response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    List<dynamic> mapList = response.data;
    return mapList.map((e) => Post.fromJson(e)).toList();
  }
}