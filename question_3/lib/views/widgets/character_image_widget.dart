import 'package:flutter/material.dart';
import 'package:question_3/data/core/models/result.dart';

class CharacterImageWidget extends StatelessWidget {
  final double? radius;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final Result characterResults;

  const CharacterImageWidget({
    super.key,
    required this.characterResults,
    this.radius = 0,
    this.height = 0,
    this.width,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: characterResults.image!,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(characterResults.image!),
      ),
    );
  }
}
