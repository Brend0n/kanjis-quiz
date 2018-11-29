import 'package:flutter/material.dart';
import 'dart:math';

class OverlayLoading extends StatefulWidget {
  // final Icon _icon;

  OverlayLoading();

  @override
  State createState() => new OverlayLoadingState();
}

class OverlayLoadingState extends State<OverlayLoading>
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
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: new Transform.rotate(
                child: new Icon(
                  Icons.cached,
                  size: _iconAnimation.value * 80,
                ),
                angle: _iconAnimation.value * 2 * pi,
              ),
            ),
            new Text(
              "Loading...",
              style: new TextStyle(color: Colors.white, fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
