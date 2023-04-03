import 'package:flutter/material.dart';
import 'package:http_app/post_repository.dart';

import 'Post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("나도 실행돼 ? ? ? ? ?  ?");
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: PostRepository().findById(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("데이터 있음");
                  Post post = snapshot.data!;
                  return Center(
                    child: Text(
                      "${post.title}",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  );
                } else {
                  print("데이터 없음");
                  return CircularProgressIndicator();
                }
              },
            ),
          ),

          Expanded(
            child: FutureBuilder(
              future: PostRepository().findAll(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Post> postList = snapshot.data!;
                  return ListView.separated(
                    itemCount: postList.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey,
                        height: 1,
                        thickness: 1,
                      );
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.ac_unit_outlined),
                        title: Text("${postList[index].title}"),
                        subtitle: Text("${postList[index].body}"),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}