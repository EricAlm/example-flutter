import 'package:flutter/material.dart';

import 'package:placeholder_json/services/user_service.dart';
import 'package:placeholder_json/ui/BoxUser.dart';
import 'package:placeholder_json/ui/SpinnerWidget.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Usuarios'),
          backgroundColor: Colors.indigo[800],
        ),
        body: FutureBuilder(
          future: UserService().getUsers(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!
                    .length, //la exclamacion para asegurar que no tenga null
                itemBuilder: (context, index) {
                  var usuario = snapshot.data![index];
                  return BoxUser(user: usuario);
                },
              );
            } else {
              return const SpinnerWidget();
            }
          },
        )
    );
  }
}