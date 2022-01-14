import 'package:flutter/material.dart';
import 'package:placeholder_json/models/User.dart';
import 'dart:math' as math;

import 'package:placeholder_json/ui/BoxDataUser.dart';
import 'package:placeholder_json/ui/BoxPost.dart';
import 'package:placeholder_json/ui/BoxPostUser.dart';

class BoxUser extends StatelessWidget {
  final User user;

  const BoxUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Row(
          children: [
            GestureDetector(
              child: CircleAvatar(
                child:
                    Text(user.name[0], style: const TextStyle(color: Colors.white)),
                backgroundColor:
                    Color((math.Random().nextInt(0xffffffff))).withAlpha(0xff),
              ),
              onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: 
        (contex) => BoxDataUser(use: user)));
      },
            ),
            Text(user.name),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: 
        (contex) => BoxPostUser (id: user.id )));
      },
    );
  }
}
