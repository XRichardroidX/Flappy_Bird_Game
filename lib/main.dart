import 'package:flappy_bird_game/Home%20Page/home%20page%20screen.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    // theme: ThemeData(
    //   brightness: Brightness.dark,
    //   canvasColor: Colors.blue,
    // ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePageScreen();
  }
}
