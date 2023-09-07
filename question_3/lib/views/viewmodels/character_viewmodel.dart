import 'package:flutter/material.dart';
import 'package:question_3/data/core/models/character.dart';
import 'package:question_3/data/core/models/result.dart';
import 'package:question_3/data/core/repository/characters_repository.dart';
import 'package:question_3/utils/loading.dart';

class CharacterViewmodel extends ChangeNotifier {
  final CharactersReposirory _charactersReposirory;
  LoadingStatus _fetchState = LoadingStatus.fetching;

  Character? character;
  final List<Result> _results = [];
  CharacterViewmodel(this._charactersReposirory);
  Future<void> getCharacters(String pageNo) async {
    if (character != null) {
      _fetchState = LoadingStatus.done;
      notifyListeners();
    } else {
      _fetchState = LoadingStatus.fetching;
      notifyListeners();
    }
    try {
      character = await _charactersReposirory.getRickMortyCharacter(pageNo);
      if (character != null) {
        _results.addAll(character!.results!);
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
  List<Result>? get characterResults => _results;
}
