import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class CustomLocationWidget extends StatelessWidget {
  CustomLocationWidget(
      {required this.iconSize,
      required this.style,
      required this.color,
        required this.location,
      Key? key, required this.widthOfText, required this.maxLines})
      : super(key: key);
  final Color color;
  final double widthOfText;
  final double iconSize;
  final TextStyle style;
  final String location;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(FontAwesomeIcons.locationDot, size: iconSize, color: color),
        const SizedBox(
          width: 4,
        ),
        SizedBox(
          width: widthOfText,
          child: Text(
            location,
            style: style,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
