import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  final blockWidth;
  final blockHeight;

  Block({
    this.blockHeight,
    this.blockWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * blockWidth / 2,
      height: MediaQuery.of(context).size.height * 3 / 4 * blockHeight / 2,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(width: 5.0, color: Colors.black12,),
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}
