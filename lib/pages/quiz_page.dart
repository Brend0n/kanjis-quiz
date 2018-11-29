import 'package:flutter/material.dart';

import './../utils/kanji.dart';
import './../utils/quiz.dart';
import './../UI/answer_button.dart';
import './../UI/kanji_text.dart';
import './../UI/overlay_answer.dart';
import './../UI/overlay_loading.dart';
import './../UI/overlay_finished.dart';

import './landing_page.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  bool overlayVisible = false;
  bool answer = true;
  bool isLoading = true;
  int score = 0;
  String kanji;
  Kanji currentKanji;

  Quiz myQuiz = new Quiz([]); // List to keep all kanjis

  List<Kanji> answers =
      new List(); //List to keep all the answers for this question

  // Load the JSON file
  Future loadStudent() async {
    String jsonString = await rootBundle.loadString('assets/kanji_n5.json');
    ;
    final jsonResponse = json.decode(jsonString);
    return jsonResponse;
  }

  @override
  void initState() {
    loadStudent().then((onValue) {
      // once Json file loaded create the new Quiz object
      myQuiz = Quiz.fromJson(onValue);
      currentKanji = myQuiz.nextKanji;
      kanji = currentKanji.kanji;

      createAnswers();
      this.setState(
          () => this.isLoading = false); // Replace loading layer by quiz layer
      super.initState();
    });
  }

  void createAnswers() {
    List<Kanji> newAnswers = new List(); // create new list of answers
    newAnswers.add(currentKanji); // add the correct answer
    // create a list of random kanjis answer
    List<Kanji> temp = myQuiz.kanjis;
    temp.shuffle();
    int i = 0;
    while (newAnswers.length < 4) {
      if (temp[i] != currentKanji) {
        newAnswers.add(temp[i]);
      }
      i++;
    }
    newAnswers.shuffle();
    answers = newAnswers;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? new Stack(
            fit: StackFit.expand, children: <Widget>[new OverlayLoading()])
        : new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new Column(
                // main page
                children: <Widget>[
                  Expanded(child: new KanjiText(kanji)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new AnswerButton(answers[0].furigana, Colors.blueGrey,
                          () {
                        print("Answer 1 clicked!");
                        this.setState(() {
                          answer = (answers[0] == currentKanji);
                          if (answer) score++;
                          overlayVisible = true;
                        });
                      }),
                      new AnswerButton(answers[1].furigana, Colors.orangeAccent,
                          () {
                        print("Answer 2 clicked!");
                        this.setState(() {
                          answer = (answers[1] == currentKanji);
                          if (answer) score++;
                          overlayVisible = true;
                        });
                      }),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new AnswerButton(answers[2].furigana, Colors.greenAccent,
                          () {
                        print("Answer 3 clicked!");
                        this.setState(() {
                          answer = (answers[2] == currentKanji);
                          if (answer) score++;
                          overlayVisible = true;
                        });
                      }),
                      new AnswerButton(answers[3].furigana, Colors.blueAccent,
                          () {
                        print("Answer 4 clicked!");
                        this.setState(() {
                          answer = (answers[3] == currentKanji);
                          if (answer) score++;
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
                        if (currentKanji == null) {
                          // Display overlay finished at first
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new OverlayFinished(
                                      score.toString() +
                                          "/" +
                                          myQuiz.kanjis.length.toString(), () {
                                    // then on Tap return to the landing page
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new LandingPage()));
                                  })));
                        }
                        kanji = currentKanji.kanji;
                        createAnswers();
                      });
                    })
                  : new Container()
            ],
          );
  }
}
