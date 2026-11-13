import 'trait.dart';

class Question {
  const Question(this.trait, this.text, this.options);

  final Trait trait;
  final String text;

  // la primera opcion vale 4 puntos y la ultima 1
  final List<String> options;

  int pointsFor(int optionIndex) => 4 - optionIndex;
}
