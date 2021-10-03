import 'package:flutter/material.dart';
import 'package:http_try/http/post_service.dart';

import 'data/Post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostService service = PostService();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List<PostModel>>(
          future: service.getPosts(),
          builder: (context, snapshot){
            if(snapshot.hasData)
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  return Text(snapshot.data![index].title);
                }
            );
            else return Text("WTF");
          },
        ),
      ),
    );
  }
}

