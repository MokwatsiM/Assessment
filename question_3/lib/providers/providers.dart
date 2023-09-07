import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:question_3/data/core/repository/characters_repository.dart';
import 'package:question_3/data/di/get_it_di.dart';
import 'package:question_3/views/viewmodels/character_viewmodel.dart';

class AppProviders {
  static List<SingleChildWidget> get allProviders {
    final List<SingleChildWidget> viewModelProviders = [
      ChangeNotifierProvider(
        create: (context) =>
            CharacterViewmodel(getInstance<CharactersReposirory>()),
      ),
    ];

    return [
      ...viewModelProviders,
    ];
  }
}
