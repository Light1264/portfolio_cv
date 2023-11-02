import 'package:flutter/material.dart';
import 'package:portfolio_cv/utils/functions.dart';

import '../main.dart';

class PageContent extends StatelessWidget {
  final String title;
  final String description;
  final String companyName;
  final bool isPickload;

  const PageContent({
    required this.title,
    required this.description,
    required this.companyName,
    this.isPickload = true,
  });

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
          const SizedBox(height: 32),
          isPickload == true
              ? GestureDetector(
                  onTap: () {
                    openExternalLink(
                        "https://play.google.com/store/apps/details?id=com.pickload.pickloaduser");
                  },
                  child: const Text(
                    "view app on Play Store",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
