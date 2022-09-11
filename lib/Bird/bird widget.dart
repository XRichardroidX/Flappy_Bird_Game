import 'package:flutter/material.dart';

class AddBird extends StatelessWidget {
  const AddBird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 60,
        child: Image.asset("Images/bird.png"),
    );
  }
}
