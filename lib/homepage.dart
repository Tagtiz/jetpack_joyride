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
  double velocity = 10;

  bool gamestarted = false;
  void startGame() {
    initialPos = gamebirdY;
    gamestarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        gamebirdY = initialPos - height;
      });
      if (gamebirdY < -50 || gamebirdY > 50) {
        timer.cancel();
        print("cancelled");
      }
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
                    color: Colors.blue,
                    child: Center(
                        child: Stack(
                      children: [
                        Container(
                          alignment: Alignment(100, 50),
                          height: 50,
                          width: 50,
                          color: Colors.black,
                        )
                      ],
                    )),
                  )),
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
