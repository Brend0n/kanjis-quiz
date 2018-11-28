import './kanji.dart';

class Quiz {
  List<Kanji> _kanjis;
  int _currentKanjiIndex = 0;
  int _score = 0;

  Quiz(this._kanjis) {
    _kanjis.shuffle();
  }

// Getters
  List<Kanji> get kanjis => _kanjis;
  int get length => _kanjis.length;
  int get kanjiNumber => _currentKanjiIndex + 1;
  int get score => -score;

  Kanji get nextKanji {
    _currentKanjiIndex++;
    if (_currentKanjiIndex >= length) {
      print("no more kanji to show");
      return null;
    }
    return _kanjis[_currentKanjiIndex];
  }

  void answer(isCorrect) {
    if (isCorrect) _score++;
  }
}
