

import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_try/data/Post.dart';

class PostService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<PostModel>> getPosts() async {
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<PostModel> posts = body
          .map(
            (dynamic item) => PostModel.fromJson(item),
      ).toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}