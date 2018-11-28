import 'package:flutter/material.dart';

import './../utils/kanji.dart';
import './../utils/quiz.dart';
import './../UI/answer_button.dart';
import './../UI/kanji_text.dart';
import './../UI/overlay_answer.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  bool overlayVisible = false;
  bool answer = true;
  String kanji;
  Kanji currentKanji;

  Quiz myQuiz = new Quiz([
    new Kanji("赤", "あか", "red"),
    new Kanji("仕事", "しごと", "work"),
    new Kanji("英語", "えいご", "english"),
    new Kanji("手紙", "てがみ", "letter"),
    new Kanji("電話", "でんわ", "telephone"),
    new Kanji("病気", "びょうき", "illness"),
    new Kanji("結婚", "けっこん", "marriage"),
    new Kanji("旅行", "りょこう", "travel"),
    new Kanji("映画", "えいが", "movie"),
    new Kanji("家族", "かぞく", "family")
  ]);

  List<Kanji> answers = new List();

  @override
  void initState() {
    super.initState();
    currentKanji = myQuiz.nextKanji;
    kanji = currentKanji.kanji;
    createAnswers();
  }

  void createAnswers() {
    // create a set of random answers
    answers.clear();
    answers.add(currentKanji); // add the correct answer
    List<Kanji> temp = myQuiz.kanjis;
    temp.shuffle();
    int i = 0;
    while (answers.length < 4) {
      if (temp[i] != currentKanji) {
        answers.add(temp[i]);
      }
      i++;
    }
    answers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          // main page
          children: <Widget>[
            Expanded(child: new KanjiText(kanji)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new AnswerButton(answers[0].furigana, Colors.blueGrey, () {
                  answer = false;
                  print("Answer 1 clicked!");
                  this.setState(() {
                    answer = (answers[0] == currentKanji);
                    overlayVisible = true;
                  });
                }),
                new AnswerButton(answers[1].furigana, Colors.orangeAccent, () {
                  answer = true;
                  print("Answer 2 clicked!");
                  this.setState(() {
                    answer = (answers[1] == currentKanji);
                    overlayVisible = true;
                  });
                }),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new AnswerButton(answers[2].furigana, Colors.greenAccent, () {
                  answer = false;
                  print("Answer 3 clicked!");
                  this.setState(() {
                    answer = (answers[2] == currentKanji);
                    overlayVisible = true;
                  });
                }),
                new AnswerButton(answers[3].furigana, Colors.blueAccent, () {
                  answer = true;
                  print("Answer 4 clicked!");
                  this.setState(() {
                    answer = (answers[3] == currentKanji);
                    overlayVisible = true;
                  });
                }),
              ],
            ),
          ],
        ),
        overlayVisible == true
            ? new OverlayAnswer(answer, currentKanji, () {
                this.setState(() {
                  overlayVisible = false;
                  currentKanji = myQuiz.nextKanji;
                  kanji = currentKanji.kanji;
                  createAnswers();
                });
              })
            : new Container()
      ],
    );
  }
}
