import 'package:flutter/material.dart';
import 'package:question_3/data/core/models/character.dart';
import 'package:question_3/data/core/models/result.dart';
import 'package:question_3/data/core/repository/characters_repository.dart';
import 'package:question_3/utils/loading.dart';

class CharacterViewmodel extends ChangeNotifier {
  final CharactersReposirory _charactersReposirory;
  LoadingStatus _fetchState = LoadingStatus.fetching;

  Character? character;
  CharacterViewmodel(this._charactersReposirory);
  Future<void> getCharacters() async {
    _fetchState = LoadingStatus.fetching;
    try {
      character = await _charactersReposirory.getRickMortyCharacter();
      if (character != null) {
        _fetchState = LoadingStatus.done;
        notifyListeners();
      } else {
        _fetchState = LoadingStatus.notfetched;
        notifyListeners();
      }
    } catch (e) {
      _fetchState = LoadingStatus.error;
      character = null;
      notifyListeners();
    }
  }

  LoadingStatus get fetchState => _fetchState;
  List<Result>? get characterResults => character!.results;
}
