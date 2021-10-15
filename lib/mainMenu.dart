import 'package:flutter/material.dart';
import 'package:jetpack_joyride/homepage.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
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
