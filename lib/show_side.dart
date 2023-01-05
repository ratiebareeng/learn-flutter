import 'dart:ui';

import 'package:flutter/material.dart';

class ShowSide extends StatelessWidget {
  const ShowSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 100.0,
              top: 20,
              bottom: 20,
              right: 20,
            ),
            child: SizedBox(
              child: Center(
                child: Text('data'),
              ),
            ),
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 0.0, sigmaX: 0.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: const Text('No menu')))
        ],
      ),
    );
  }
}
