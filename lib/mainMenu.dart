import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jetpack_joyride/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _highscore = 0;

  @override
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // prefs.setInt('highscore', 0);
      _highscore = (prefs.getInt('highscore') ?? 0);
      print(_highscore);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Jetpack Funride",
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 56,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Highscore: " + _highscore.toString(),
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 32,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow)),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Homepage()),
                  // );
                  Navigator.popAndPushNamed(context, '/game');
                },
                child: Text(
                  "Start Game",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow)),
                onPressed: () {
                  SystemChannels.platform.invokeMethod("SystemNavigator.pop");
                },
                child: Text(
                  "Exit",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
