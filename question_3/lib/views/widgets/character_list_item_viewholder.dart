import 'package:flutter/material.dart';
import 'package:question_3/data/core/models/result.dart';
import 'package:question_3/utils/status.dart';
import 'package:question_3/views/style_constants.dart';
import 'package:question_3/views/widgets/StatusRowListItem.dart';
import 'package:question_3/views/widgets/status_container_widget.dart';

class CharacterListItemViewHolder extends StatelessWidget {
  const CharacterListItemViewHolder({
    super.key,
    required this.characterResults,
  });

  final Result characterResults;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(105.0, 10.0, 16.0, 16.0),
      constraints: const BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            characterResults.name!,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: "Product-Sans",
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          StatusRowListItem(characterResults: characterResults),
          const SizedBox(
            height: 4.0,
          ),
          Expanded(
            child: Text(
              "Origin: ${characterResults.origin!.name!}",
              style: originText,
            ),
          )
        ],
      ),
    );
  }
}


