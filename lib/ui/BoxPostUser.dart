import 'package:flutter/material.dart';
import 'package:placeholder_json/services/post_service.dart';
import 'package:placeholder_json/ui/BoxPost.dart';
import 'package:placeholder_json/ui/SpinnerWidget.dart';

class BoxPostUser extends StatelessWidget {
  final int id;
  const BoxPostUser({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Publicaciones"),),
      body: FutureBuilder(
          future: PostService().getPostUser(id),
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