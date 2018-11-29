import 'package:flutter/material.dart';
import 'dart:math';

class OverlayFinished extends StatefulWidget {
  final String _message;
  final VoidCallback _onTap;

  OverlayFinished(this._message, this._onTap);

  @override
  State createState() => new OverlayFinishedState();
}

class OverlayFinishedState extends State<OverlayFinished>
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
      color: Colors.black45,
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
                  Icons.weekend,
                  size: _iconAnimation.value * 110,
                ),
                angle: _iconAnimation.value * 2 * pi,
              ),
            ),
            new Text(
              "Finished!!!",
              style: new TextStyle(color: Colors.white, fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
            new Text(
              widget._message,
              style: new TextStyle(color: Colors.blueAccent, fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
