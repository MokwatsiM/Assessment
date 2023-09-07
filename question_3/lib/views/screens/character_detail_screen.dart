import 'package:flutter/material.dart';
import 'package:question_3/data/core/models/result.dart';
import 'package:question_3/views/style_constants.dart';
import 'package:question_3/views/widgets/character_detail_body_widget.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Result character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          character.name!,
          style: appbarStyle,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: Navigator.of(context).pop,
        ),
        elevation: 0.0,
      ),
      body: CharacterDetailBodyWidget(
        characterResults: character,
      ),
    );
  }
}
