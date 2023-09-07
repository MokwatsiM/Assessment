import 'package:question_3/data/core/datasource/characters_datasource.dart';
import 'package:question_3/data/core/models/character.dart';
import 'package:question_3/data/core/repository/characters_repository.dart';

class CharacterReposiroryImpl extends CharactersReposirory {
  final CharactersRemoteDataSource _charactersRemoteDataSource;

  CharacterReposiroryImpl(this._charactersRemoteDataSource);
  @override
  Future<Character?> getRickMortyCharacter() async {
    try {
      final character =
          await _charactersRemoteDataSource.getRickyMortyCharacters();
      return character;
    } catch (e) {
      return null;
    }
  }
}
