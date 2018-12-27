import 'package:flutter/material.dart';
import '../pages/quiz_page.dart';
import './../UI/menu_button.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: FittedBox(
            fit: BoxFit.cover, // otherwise the logo will be tiny
            child: const FlutterLogo(),
          )),
          RichText(
            text: TextSpan(
              text: 'Pick your level:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 30.0),
            ),
          ),
          new MenuButton(
            "N5",
            Colors.purple,
            () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new QuizPage(file: 'assets/kanji_n5.json'))),
          ),
          new MenuButton(
            "N4",
            Colors.blueGrey,
            () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new QuizPage(file: 'assets/kanji_n4.json'))),
          )
        ],
      ),
    );
  }
}
