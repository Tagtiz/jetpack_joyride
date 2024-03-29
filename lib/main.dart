import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jetpack_joyride/mainMenu.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
      routes: <String, WidgetBuilder> {
          '/main': (BuildContext context) => new MainMenu(),
          '/game' : (BuildContext context) => new Homepage(),
          // '/bmi' : (BuildContext context) => new InputPage(),
          // '/realprofile' : (BuildContext context) => new Screen4()
        },
    );
  }
}
  