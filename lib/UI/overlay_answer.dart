import 'package:flutter/material.dart';
import 'dart:math';
import '../utils/kanji.dart';

class OverlayAnswer extends StatefulWidget {
  // final Icon _icon;
  final bool _isCorrect;
  final Kanji _correctAnswer;
  final VoidCallback _onTap;

  OverlayAnswer(this._isCorrect, this._correctAnswer, this._onTap);

  @override
  State createState() => new OverlayAnswerState();
}

class OverlayAnswerState extends State<OverlayAnswer>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    _iconAnimationController = new AnimationController(
        duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: widget._onTap,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: new Transform.rotate(
                child: new Icon(
                  widget._isCorrect ? Icons.done : Icons.clear,
                  size: _iconAnimation.value * 80,
                ),
                angle: _iconAnimation.value * 2 * pi,
              ),
            ),
            new Text(
              widget._isCorrect
                  ? "Correct"
                  : "Wrong \n " +
                      widget._correctAnswer.kanji +
                      " : " +
                      widget._correctAnswer.furigana +
                      " \n" +
                      widget._correctAnswer.translation,
              style: new TextStyle(
                  color: widget._isCorrect ? Colors.white : Colors.red,
                  fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
