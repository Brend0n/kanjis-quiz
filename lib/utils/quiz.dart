import './kanji.dart';

class Quiz {
  List<Kanji> _kanjis;
  int _currentKanjiIndex = 0;
  int _score = 0;

  Quiz(this._kanjis) {
    _kanjis.shuffle();
  }

  factory Quiz.fromJson(List<dynamic> parsedJson) {
    List<Kanji> kanjis = new List<Kanji>();
    for (int i = 0; i < parsedJson.length; i++) {
      Kanji newKanji = new Kanji(parsedJson[i]['kanji'],
          parsedJson[i]['furigana'], parsedJson[i]['translation']);
      kanjis.add(newKanji);
    }
    return new Quiz(kanjis);
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
