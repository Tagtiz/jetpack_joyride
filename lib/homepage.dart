import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double gamebirdY = 0;
  double initialPos = 0;
  double height = 0;
  double time = 0;
  double gravity = -4.9;
  // double gravity = -0.1;
  double velocity = 5;
  double bgX = 0;

  bool gamestarted = false;
  void startGame() {
    initialPos = gamebirdY;
    gamestarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        bgX -= 5;
        if (initialPos - height < -1) {
          initialPos = -1;
          height = 0;
        } else if (initialPos - height > 1) {
          initialPos = 1;
          height = 0;
        }
        gamebirdY = initialPos - height;
      });
      // if (gamebirdY < -5 || gamebirdY > 10) {
      // timer.cancel();
      //   print("cancelled");
      // }
      time += 0.1;
    });
  }

  void jump() {
    setState(() {
      time = 0;
      initialPos = gamebirdY;
    });
    print("jump");
    print(gamebirdY);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gamestarted ? jump : startGame,
      child: Container(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 15,
                child: Container(
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage("lib/assets/background.png"),
                  //         fit: BoxFit.cover)),
                  // color: Colors.blue,
                  child: Center(
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          top: 0,
                          left: bgX,
                          height: 600,
                          width: 1050,
                          child: Image.asset("lib/assets/background.png"),
                          duration: Duration(microseconds: 200),
                        ),
                        AnimatedPositioned(
                          top: 0,
                          left: 1050 + bgX,
                          height: 600,
                          width: 1050,
                          child: Image.asset("lib/assets/background.png"),
                          duration: Duration(microseconds: 200),
                        ),
                        Container(
                          alignment: Alignment(0, gamebirdY),
                          height: 1050, //50
                          width: 600, //50
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.purple,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
