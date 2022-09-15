import 'package:flutter/material.dart';

class AddBird extends StatelessWidget {
  final AxisY;
  final double birdWidth;
  final double birdHeight;
        AddBird({this.AxisY, required this.birdWidth, required this.birdHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, (2 * AxisY + birdHeight) / (2 - birdHeight)),
        height: MediaQuery.of(context).size.height * birdWidth / 2,
        width: MediaQuery.of(context).size.height * 3 / 4 * birdHeight / 2,
        child: Image.asset("Images/bird.png", fit: BoxFit.fill,),
    );
  }
}
