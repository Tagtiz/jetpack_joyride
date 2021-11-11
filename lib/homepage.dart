import 'dart:async';
import 'dart:math';

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
  bool isJump = false;
  int randCoin = 0;
  var randomizer = new Random();
  bool gamestarted = false;
  int startYCoin = 0;
  int halfYCoin = 0;
  List<double> coinYLoc = [0.0, 0.0, 0.0, 0.0, 0.0];

  void setCoinPath(x) {
    switch (x) {
      case 0:
        {
          //upper upper
          coinYLoc[0] = 1;
          break;
        }
      case 1:
        {
          //upper lower
          coinYLoc[0] = 0.75;
          break;
        }
      case 2:
        {
          //lower upper
          coinYLoc[0] = 0.5;
          break;
        }
      case 3:
        {
          //lower lower
          coinYLoc[0] = 0.25;
          break;
        }
    }
    for (int i = 1; i <= 4; i++) {
      coinYLoc[i] = coinYLoc[i - 1] + 0.15;
    }
  }

  void startGame() {
    randCoin = randomizer.nextInt(5);
    setCoinPath(randCoin);
    initialPos = gamebirdY;
    gamestarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      // jump();
      height = gravity * time * time + velocity * time;
      setState(() {
        if (bgX <= -1050) {
          bgX = 0;
        } else {
          bgX -= 5;
        }
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
      // onTap: gamestarted ? null : startGame,
      // onTapDown: (TapDownDetails details) {
      //   isJump = true;
      // },
      // onTapUp: (TapUpDetails details) {
      //   isJump = false;
      // },
      child: Container(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 15,
                child: Container(
                  // decoration: BoxDecoration(
                  // image: DecorationImage(
                  //     image: AssetImage("lib/assets/background.png"),
                  //     fit: BoxFit.cover)),
                  // color: Colors.blue,
                  child: Center(
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          top: 0,
                          left: bgX,
                          // height: 600,
                          // width: 1050,
                          child: Image.asset("lib/assets/background.png"),
                          duration: Duration(microseconds: 200),
                        ),
                        AnimatedPositioned(
                          top: 0,
                          left: 1050 + bgX,
                          // height: 600,
                          // width: 1050,
                          child: Image.asset("lib/assets/background.png"),
                          duration: Duration(microseconds: 200),
                        ),
                        Container(
                          alignment: Alignment(0, gamebirdY),
                          // height: 1050, //50
                          // width: 600, //50
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.asset("lib/assets/flying.png"),
                            // color: Colors.purple,
                          ),
                        ),
                        Container(
                          alignment: Alignment(0, coinYLoc[0]),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.yellow,
                          ),
                        ),
                        Container(
                          alignment: Alignment(0.2, coinYLoc[1]),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.yellow,
                          ),
                        ),
                        Container(
                          alignment: Alignment(0.4, coinYLoc[2]),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.yellow,
                          ),
                        ),
                        Container(
                          alignment: Alignment(0.6, coinYLoc[3]),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.yellow,
                          ),
                        ),
                        Container(
                          alignment: Alignment(0.8, coinYLoc[4]),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.yellow,
                          ),
                        ),
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
