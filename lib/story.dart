class Story {
  String scenario;
  String choiceOne;
  String choiceTwo;
  int choiceOneNext;
  int choiceTwoNext;

  Story(
      {required this.scenario,
      required this.choiceOne,
      required this.choiceTwo,
      required this.choiceOneNext,
      required this.choiceTwoNext});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      scenario: json['scenario'],
      choiceOne: json['choice1'],
      choiceTwo: json['choice2'],
      choiceOneNext: json['choice1_next'],
      choiceTwoNext: json['choice2_next'],
    );
  }
}
