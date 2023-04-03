import 'package:dio/dio.dart';
import 'package:http_app/Post.dart';

class PostRepository{
  final dio = Dio();

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
