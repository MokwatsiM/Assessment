import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:question_3/utils/loading.dart';
import 'package:question_3/views/viewmodels/character_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:question_3/views/widgets/character_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<CharacterViewmodel>(context, listen: false)
          .getCharacters("1");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Rick and Morty Characters'),
      ),
      body: Consumer<CharacterViewmodel>(
        builder: (BuildContext context, CharacterViewmodel viewmodel, _) {
          return _checkStatus(viewmodel);
        },
      ),
    );
  }

  Widget _checkStatus(CharacterViewmodel viewmodel) {
    return ConditionalSwitch.single<LoadingStatus>(
      context: context,
      valueBuilder: (BuildContext context) => viewmodel.fetchState,
      caseBuilders: {
        LoadingStatus.fetching: (BuildContext context) =>
            const Center(child: CircularProgressIndicator()),
        LoadingStatus.notfetched: (BuildContext context) =>
            const Text("could not retrieve the characters"),
        LoadingStatus.done: (BuildContext context) =>
            _createContent(viewModel: viewmodel),
        LoadingStatus.error: (BuildContext context) =>
            const Text("an error occured"),
      },
      fallbackBuilder: (BuildContext context) => const SizedBox(),
    );
  }

  _createContent({required CharacterViewmodel viewModel}) {
    return CharacterListView(
      characterList: viewModel.characterResults!,
      info: viewModel.character!.info!,
    );
  }
}
