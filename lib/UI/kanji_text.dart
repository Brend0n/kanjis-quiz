import 'package:flutter/material.dart';

class KanjiText extends StatefulWidget {
  final String _kanji;

  KanjiText(this._kanji);

  @override
  State createState() => new KanjiTextState();
}

class KanjiTextState extends State<KanjiText>
    with SingleTickerProviderStateMixin {
  // SingleTickerProvi... allow for a single animation provider
  // TickerProvi... allow for multiple animation provider
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(
      duration: new Duration(milliseconds: 1200),
      vsync: this,
    );
    _fontSizeAnimation = new CurvedAnimation(
        parent: _fontSizeAnimationController, curve: Curves.bounceOut);
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
  }

  @override
  void didUpdateWidget(KanjiText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._kanji != widget._kanji) {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 30.0),
        child: new Center(
          child: new Text(
            widget._kanji,
            style: new TextStyle(
                fontSize: _fontSizeAnimation.value * 55,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
