import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final String textToDisplay;
  final Widget? sibling;
  const ResultWidget({super.key, required this.textToDisplay, this.sibling});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(textToDisplay),
          sibling ?? Container(),
        ],
      ),
    );
  }
}
