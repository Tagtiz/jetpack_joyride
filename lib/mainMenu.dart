import 'package:flutter/material.dart';
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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Highscore: " + _highscore.toString()),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Homepage()),
              // );
              Navigator.popAndPushNamed(context, '/game');
            },
            child: Text("Start Game"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Options"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Exit"),
          ),
        ],
      ),
    );
  }
}
