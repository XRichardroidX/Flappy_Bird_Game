import 'dart:async';
import 'package:flappy_bird_game/Bird/bird%20widget.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  static double AxisY = 0;
  double time = 0;
  double finalHeight = 0;
  double initHeight = AxisY;
  bool gameStarted = false;

   void Jump(){
     setState(() {
time = 0;
initHeight = AxisY;
     });
     }

     void startGame(){
     gameStarted = true;
       Timer.periodic(Duration(milliseconds: 60), (timer){
         time += 0.05;
         finalHeight = -4.9 * time * time + 2.8 * time;
         setState(() {
           AxisY = initHeight - finalHeight;
         });
         if(AxisY > 1){
           timer.cancel();
           gameStarted = false;
         }
       });
     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: GestureDetector(
                  onTap: (){
                    if(gameStarted){
                      Jump();
                    }
                    else{
                      startGame();
                    }
                  },
                child: AnimatedContainer(
                  alignment: Alignment(0, AxisY),
                  duration: const Duration(milliseconds: 0),
                  color: Colors.blue[600],
                  child: AddBird(),
          ),
              )),
          Expanded(child: Container(
            color: Colors.green,
          ))
        ],
      ),
    );
  }
}
