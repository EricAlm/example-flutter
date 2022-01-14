import 'package:flutter/material.dart';
import 'package:placeholder_json/UserList.dart';

import 'package:placeholder_json/services/post_service.dart';
import 'package:placeholder_json/ui/BoxPost.dart';
import 'package:placeholder_json/ui/SpinnerWidget.dart';

void main() {
  runApp(
    const MaterialApp(
      home: UserList(),
      title: "JSON PlaceHolder",
      debugShowCheckedModeBanner: false,
    ),
  );
}

class WidgetPost extends StatelessWidget {
  const WidgetPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Publicaciones"),),
      body: FutureBuilder(
          future: PostService().getPost(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!
                    .length, //la exclamacion para asegurar que no tenga null
                itemBuilder: (context, index) {
                  var post = snapshot.data![index];
                  return BoxPost(publicacion: post);
                },
              );
            } else {
              return const SpinnerWidget();
            }
          },
        ) ,
    );
  }
}

