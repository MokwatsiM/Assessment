import 'package:flutter/material.dart';
import 'package:question_3/data/core/models/info.dart';
import 'package:question_3/data/core/models/result.dart';
import 'package:question_3/views/screens/character_detail_screen.dart';
import 'package:question_3/views/widgets/character_image_widget.dart';
import 'package:question_3/views/widgets/character_list_item_viewholder.dart';

class CharacterListView extends StatelessWidget {
  final List<Result> characterList;
  final Info info;
  const CharacterListView(
      {super.key, required this.characterList, required this.info});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characterList.length,
      itemBuilder: (BuildContext context, int index) {
        final characterResults = characterList[index];
        return Container(
          height: 150.0,
          margin: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterDetailScreen(
                    character: characterResults,
                  ),
                ),
              );
            },
            child: Stack(
              children: <Widget>[
                Container(
                  height: 150.0,
                  margin: const EdgeInsets.only(left: 46.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 17, 35, 54),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: CharacterListItemViewHolder(
                      characterResults: characterResults),
                ),
                Container(
                  alignment: FractionalOffset.centerLeft,
                  child: CharacterImageWidget(
                    characterResults: characterResults,
                    radius: 60,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
