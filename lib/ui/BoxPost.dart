import 'package:flutter/material.dart';
import 'package:placeholder_json/UserList.dart';
import 'package:placeholder_json/models/Post.dart';

class BoxPost extends StatelessWidget {
  final Post publicacion;

  const BoxPost({Key? key, required this.publicacion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(publicacion.title),
          subtitle: Text(publicacion.body),
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (contex) => const UserList()));
      },
    );
  }
}