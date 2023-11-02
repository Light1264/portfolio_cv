import 'package:flutter/material.dart';
import 'package:portfolio_cv/main.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.headerText,
    required this.content,
  });
  final String headerText;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerText,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: colorConstants.appBlack,
          ),
        ),
        Text(
          content,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: colorConstants.appBlack,
          ),
        ),
      ],
    );
  }
}
