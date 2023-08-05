import 'package:flutter/material.dart';

import 'choice_button.dart';
import 'globals.dart';
import 'story.dart';

class MainScreen extends StatelessWidget {
  var context;
  int index;

  MainScreen({
    super.key,
    required this.context,
    required this.index,
  });

  List<Story> storyList = Globals.storyList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10.0),
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                ),
                child: Text(
                  storyList[index].scenario,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          ChoiceButton(
            context: context,
            choiceNumber: 1,
            choice: storyList[index].choiceOne,
            index: index,
          ),
          Visibility(
            visible: storyList[index].choiceTwo != "",
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: ChoiceButton(
              context: context,
              choiceNumber: 2,
              choice: storyList[index].choiceTwo,
              index: index,
            ),
          ),
        ],
      ),
    );
  }
}
