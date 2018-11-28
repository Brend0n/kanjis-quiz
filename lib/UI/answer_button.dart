import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String _answer;
  final Color _color;
  final VoidCallback _onTap;

  AnswerButton(this._answer, this._color, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        // true Button
        color: this._color,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.white, width: 3.0)),
              padding: new EdgeInsets.all(5.0),
              margin: EdgeInsets.all(20.0),
              child: new Text(
                this._answer,
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
