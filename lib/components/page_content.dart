import 'package:flutter/material.dart';

import '../main.dart';

class PageContent extends StatelessWidget {
  final String title;
  final String description;
  final String companyName;

  const PageContent(
      {required this.title,
      required this.description,
      required this.companyName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: colorConstants.appBlack,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            companyName,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: colorConstants.appBlack,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            description,
            style: TextStyle(
              fontSize: 20,
              color: colorConstants.appBlack,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
