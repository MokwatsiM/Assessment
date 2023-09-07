import 'package:flutter/material.dart';

class StatusContainerWidget extends StatelessWidget {
  final Color colors;
  const StatusContainerWidget({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
        color: colors,
      ),
    );
  }
}
