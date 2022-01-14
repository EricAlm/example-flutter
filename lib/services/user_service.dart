import 'package:http/http.dart' as http;
import 'package:placeholder_json/models/Post.dart';
import 'dart:convert';
import 'package:placeholder_json/models/User.dart';

class UserService {
  final String API_url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> getUsers() async {
    http.Response response = await http.get(Uri.parse(API_url));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      List<User> usersList = List<User>.from(
          data.map((i) => User.fromJson(i))); //transform json a list
      return usersList;
    }
    return <User>[]; //retorno lista vacia si no obtengo respuesta
  }
}
