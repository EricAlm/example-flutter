import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:placeholder_json/models/Post.dart';

class PostService{
  final String api_url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPost() async{
    http.Response response = await http.get(Uri.parse(api_url));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      List<Post> postList = List<Post>.from(
          data.map((i) => Post.fromJson(i))); //transform json a list
      return postList;
    }
    return <Post>[];
  }

  Future<List<Post>> getPostUser(int id) async{
    final String api_url = 'https://jsonplaceholder.typicode.com/users/$id/posts';
    http.Response response = await http.get(Uri.parse(api_url));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      List<Post> postList = List<Post>.from(
          data.map((i) => Post.fromJson(i))); //transform json a list
      return postList;
    }
    return <Post>[];
  }
}