import 'package:question_3/data/core/models/character.dart';

abstract class CharactersReposirory {
  Future<Character?> getRickMortyCharacter();
}
