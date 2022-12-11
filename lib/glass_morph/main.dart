import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new FrostedDemo()));
}

class FrostedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber,
      body:  Stack(
        children: <Widget>[
          /*new ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: new FlutterLogo()
          ),*/
           Center(
            child:  ClipRect(
              child:  BackdropFilter(
                filter:  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child:  Container(
                  width: 200.0,
                  height: 200.0,
                  decoration:  BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5)
                  ),
                  child: const Center(
                    child:  Text(
                        'Frosted',
                        style: TextStyle()
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}