import 'package:dio/dio.dart';
import 'package:http_app/post_repository.dart';


void main () async {
  await findById_test();
}

Future<void> findById_test() async{
  //given
  int id = 1;
  //when
  PostRepository postRepository = PostRepository();
  await postRepository.findById(id);
  //then
}

Future<void> findAll_test() async{
  //given

  //when
  PostRepository postRepository = PostRepository();
  await postRepository.findAll();
  //then
}