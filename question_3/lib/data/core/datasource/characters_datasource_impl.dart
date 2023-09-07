import 'package:question_3/data/api/api_client.dart';
import 'package:question_3/data/core/datasource/characters_datasource.dart';
import 'package:question_3/data/core/models/character.dart';

class CharactersRemoteDataSourceImpl extends CharactersRemoteDataSource {
  final ApiClient _client;

  CharactersRemoteDataSourceImpl(this._client);

  @override
  Future<Character> getRickyMortyCharacters(String pageNo) async {
    final response = await _client.get(pageNo: pageNo);
    final Character characterResults = Character.fromJson(response);
    return characterResults;
  }
}
