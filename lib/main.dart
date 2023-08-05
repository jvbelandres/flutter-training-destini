import 'dart:convert';

import 'package:destini/story.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'globals.dart';
import 'main_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Destiny',
      home: DestiniApp(),
    ),
  );
}

class DestiniApp extends StatelessWidget {
  const DestiniApp({Key? key}) : super(key: key);

  Future<List<Story>> readJsonStory() async {
    String jsonData = await rootBundle.loadString('story.json');
    // remove "//" so it will not be added when parsing
    jsonData = jsonData.replaceAll(r"\\", "");

    Map<String, dynamic> jsonDataMap = jsonDecode(jsonData);
    List<dynamic> jsonList = jsonDataMap['story'];
    Globals.storyList = jsonList.map((json) => Story.fromJson(json)).toList();

    return Globals.storyList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Story>>(
        future: readJsonStory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('There\'s an error when parsing the json.'),
            );
          } else if (snapshot.hasData) {
            return MainScreen(
              context: this,
              index: 0,
            );
          } else {
            return const Center(
              child: Text('No data found'),
            );
          }
        },
      ),
    );
  }
}
