import 'package:flutter/material.dart';
import 'package:question_3/data/core/models/result.dart';
import 'package:question_3/utils/status.dart';
import 'package:question_3/views/style_constants.dart';
import 'package:question_3/views/widgets/status_container_widget.dart';

class StatusRowListItem extends StatelessWidget {
  const StatusRowListItem({
    super.key,
    required this.characterResults,
  });

  final Result characterResults;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (characterResults.status!.toLowerCase() == Status.alive.name)
          const StatusContainerWidget(
            colors: Colors.green,
          )
        else if (characterResults.status!.toLowerCase() == Status.dead.name)
          const StatusContainerWidget(
            colors: Colors.red,
          )
        else
          const StatusContainerWidget(
            colors: Colors.grey,
          ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            "${characterResults.status} - ${characterResults.species}",
            style: wp24,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
