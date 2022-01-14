import 'package:flutter/material.dart';
import 'package:placeholder_json/models/User.dart';

class BoxDataUser extends StatelessWidget {
  final User use;

  const BoxDataUser({Key? key,required this.use}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuario: " + use.username),
      ),
      body: ListView(padding: const EdgeInsets.all(15.0), children: <Widget>[
        Text("Email: " + use.email),
        Text("Cel: " + use.phone),
        Text("Sitio Web: " + use.website),
      ]),
    );
  }
}