import 'package:flutter/material.dart';
import 'package:question_3/data/core/models/result.dart';
import 'package:question_3/utils/status.dart';
import 'package:question_3/views/style_constants.dart';
import 'package:question_3/views/widgets/character_image_widget.dart';
import 'package:question_3/views/widgets/character_item_row.dart';

class CharacterDetailBodyWidget extends StatelessWidget {
  final Result characterResults;
  const CharacterDetailBodyWidget({super.key, required this.characterResults});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width - 30,
          margin: const EdgeInsets.only(top: 110, left: 15.0),
          child: Card(
            color: const Color.fromARGB(255, 17, 35, 54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(height: 60.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          characterResults.name!.toUpperCase(),
                          style: detailName,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FilterChip(
                        onSelected: (a) {},
                        label: Row(
                          children: <Widget>[
                            characterResults.status!.toLowerCase() ==
                                    Status.alive.name
                                ? alive
                                : dead,
                            const SizedBox(width: 6),
                            Text(
                              "${characterResults.status} - ${characterResults.species}",
                              style: bp24,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Gender: ", style: gp24),
                      Text(characterResults.gender!, style: wp24),
                    ],
                  ),
                  CharacterItemRow(
                    characterResults: characterResults,
                    text: "Origin:",
                  ),
                  CharacterItemRow(
                    characterResults: characterResults,
                    text: "Location: ",
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 200,
          width: 200,
          margin: const EdgeInsets.only(top: 20, left: 115),
          child: CharacterImageWidget(
            characterResults: characterResults,
          ),
        ),
      ],
    );
  }
}
