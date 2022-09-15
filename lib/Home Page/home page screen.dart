import 'dart:async';
import 'package:flappy_bird_game/Bird/bird%20widget.dart';
import 'package:flappy_bird_game/Blocks/block.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  static double AxisY = 0;
  double velocity = 2.5;
  double gravity = -4.9;
  double time = 0;
  double finalHeight = 0;
  double initHeight = AxisY;
  bool gameStarted = false;
  double birdWidth = 0.1;
  double birdHeight = 0.1;
  int score = 0;

 // static List<double> blockX = [2, 3.5, 5, 6.5];
  double blockX1 = 2;
  double blockX2 = 3.5;
  double blockX3 = 5;
  double blockX4 = 6.5;

  static double blockWidth = 0.5;
  static double blockHeight = 0.6;

  void Jump() {
    setState(() {
      time = 0;
      initHeight = AxisY;
    });
  }

  bool birdIsDead(){
    // if(AxisY < -1 || AxisY > 1){
    //   return true;
    // }
    if((blockX1 - (blockWidth / 2)) <= 0 && (blockX1 + (blockWidth / 2)) >= 0) {
      if ((AxisY <= -blockHeight)) {
        return true;
      }
      score++;
    }
      if((blockX2 - (blockWidth / 2)) <= 0 && (blockX2 + (blockWidth / 2)) >= 0) {
        if ((blockHeight <= AxisY)) {
          return true;
        }
        score++;
      }
      if((blockX3 - (blockWidth / 2)) <= 0 && (blockX3 + (blockWidth / 2)) >= 0) {
        if ((AxisY <= -blockHeight)) {
          return true;
        }
        score++;
      }
      if((blockX4 - (blockWidth / 2)) <= 0 && (blockX4 + (blockWidth / 2)) >= 0) {
        if ((blockHeight <= AxisY)) {
          return true;
        }
        score++;
      }
    return false;
  }

  void restartGame(){
   setState(() {
     gameStarted = false;
     double blockX1 = 4.5;
     double blockX2 = 6;
     double blockX3 = 7.5;
     double blockX4 = 9.0;

     AxisY = 0;
     initHeight = 0;
     finalHeight = 0;
     time = 0;
   });
   Navigator.pop(context);
  }

  void startGame() {
    gameStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      finalHeight = -4.9 * time * time + velocity * time;
       setState(() {
         blockX1 -= 0.11;
         blockX2 -= 0.11;
         blockX3 -= 0.11;
         blockX4 -= 0.11;
         AxisY = initHeight - finalHeight;
       });
      // Check if bird is dead
      if(birdIsDead()){
        // When the game is over stop the game
        timer.cancel();
        _showDialogMessage();
        gameStarted = false;
      }
      // Repeat blocks
        if(blockX1 <= -2.4){
          blockX1 = 2.4;
        }
        else if(blockX2 <= -2.4){
          blockX2 = 2.4;
        }
        else if(blockX3 <= -2.4){
          blockX3 = 2.4;
        }
        else if(blockX4 <= -2.4){
          blockX4 = 2.4;
        }
    });
  }

  _showDialogMessage(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: Center(
              child: Text(
                "G A M E  O V E R",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: this.restartGame,
                child: ClipRect(
                  child: Container(
                    padding: EdgeInsets.all(7),
                    color: Colors.white,
                    child: Text(
                      "PLAY AGAIN",
                      style: TextStyle(
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (gameStarted) {
          Jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0, AxisY),
                      duration: const Duration(milliseconds: 0),
                      color: Colors.blue[600],
                      child: AddBird(AxisY: AxisY, birdWidth: birdWidth, birdHeight: birdHeight,),
                    ),
                    Container(
                      alignment: Alignment(0, -0.365),
                      child: gameStarted
                          ? Text(" ")
                          : Text(
                              "T A P  T O  P L A Y",
                              style:
                                  TextStyle(fontSize: 19.0, color: Colors.white),
                            ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(blockX1, -1),
                      child: Block(
                        blockWidth: blockWidth,
                        blockHeight: blockHeight,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(blockX2, 1),
                      child: Block(
                        blockWidth: blockWidth,
                        blockHeight: blockHeight,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(blockX3, -1),
                      child: Block(
                        blockWidth: blockWidth,
                        blockHeight: blockHeight,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(blockX4, 1),
                      child: Block(
                        blockWidth: blockWidth,
                        blockHeight: blockHeight,
                      ),
                    ),
                  ],
                )),
            Container(
              height: 16,
              color: Colors.green,
            ),
            Expanded(
                child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Score",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "${score}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "BEST",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "10",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
