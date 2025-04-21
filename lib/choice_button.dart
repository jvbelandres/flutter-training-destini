import 'package:flutter/material.dart';

import 'globals.dart';
import 'main_screen.dart';
import 'story.dart';

class ChoiceButton extends StatelessWidget {
  String choice;
  int choiceNumber;
  var context;
  int index;

  ChoiceButton({
    super.key,
    required this.choice,
    required this.choiceNumber,
    required this.context,
    required this.index,
  });

  List<Story> storyList = Globals.storyList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: choiceNumber == 1
          ? const EdgeInsets.all(10.0)
          : const EdgeInsets.only(
              top: 10.0, left: 10.0, right: 10.0, bottom: 50.0),
      child: ElevatedButton(
        onPressed: () => choiceClicked(choiceNumber),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              choiceNumber == 1 ? Colors.red : Colors.blue),
          padding: MaterialStateProperty.all(
              const EdgeInsets.only(top: 30.0, bottom: 30.0)),
        ),
        child: Text(
          choice,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void choiceClicked(int choiceNumber) {
    if (storyList[index].choiceOneNext == 0 &&
        storyList[index].choiceTwoNext == 0) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else {
      if (choiceNumber == 1) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MainScreen(
              context: context,
              index: storyList[index].choiceOneNext,
            ),
          ),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MainScreen(
              context: context,
              index: storyList[index].choiceTwoNext,
            ),
          ),
        );
      }
    }
  }
}
