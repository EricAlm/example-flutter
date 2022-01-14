import 'package:flutter/material.dart';

class SpinnerWidget extends StatelessWidget {
  const SpinnerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: AlignmentDirectional.bottomCenter,
        child: Column(
          children: const <Widget>[
              CircularProgressIndicator()
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}