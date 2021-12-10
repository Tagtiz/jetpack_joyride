import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jetpack_joyride/loader_controller.dart';

class OverlayView extends StatelessWidget {
  const OverlayView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: Loader.appLoader.loaderShowingNotifier,
      builder: (context, value, child) {
        if (value) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Opacity(
                opacity: 0.7,
                child: Scaffold(
                  backgroundColor: Colors.black,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "GAME OVER",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 56,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.yellow)),
                        onPressed: () {
                          Loader.appLoader.hideLoader();
                          Navigator.popAndPushNamed(context, '/main');
                        },
                        child: Text(
                          "Return to Main Menu",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
              ),
            ]),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
