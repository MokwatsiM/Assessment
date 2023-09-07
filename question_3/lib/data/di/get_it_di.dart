import 'package:get_it/get_it.dart';
import 'package:http/http.dart';  

import 'package:question_3/data/api/api_client.dart';
import 'package:question_3/data/core/datasource/characters_datasource.dart';
import 'package:question_3/data/core/datasource/characters_datasource_impl.dart';
import 'package:question_3/data/core/repository/character_repository_impl.dart';
import 'package:question_3/data/core/repository/characters_repository.dart';

final getInstance = GetIt.instance;
Future<void> init() async {
  getInstance.registerLazySingleton<Client>(() => Client());
  getInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getInstance<Client>()));
  getInstance.registerLazySingleton<CharactersRemoteDataSource>(
      () => CharactersRemoteDataSourceImpl(getInstance<ApiClient>()));
  getInstance.registerLazySingleton<CharactersReposirory>(
      () => CharacterReposiroryImpl(getInstance<CharactersRemoteDataSource>()));
}
