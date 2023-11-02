import 'package:flutter/material.dart';

import '../main.dart';

class ImagePageContent extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;
  final Function() textFunction;

  ImagePageContent({
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.textFunction,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imageAsset,
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: colorConstants.appBlack,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: colorConstants.appBlack,
            ),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: textFunction,
            child: const Text(
              "view app on github",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
