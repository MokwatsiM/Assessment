import 'package:flutter/material.dart';
import 'package:question_3/data/core/models/result.dart';
import 'package:question_3/views/style_constants.dart';

class CharacterItemRow extends StatelessWidget {
  final String text;
  const CharacterItemRow({
    super.key,
    required this.characterResults,
    required this.text,
  });

  final Result characterResults;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(text, style: gp24),
        Expanded(
          child: Text(
            characterResults.location!.name!,
            style: wp24,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
