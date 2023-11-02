import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_cv/main.dart';

import '../core/app_export.dart';

showMyDialog(
  BuildContext context,
) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        actionsAlignment: MainAxisAlignment.spaceAround,
        content: Text(
          "Are you sure you want to\nlog Out?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: colorConstants.appBlack,
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Get.back();
            },
            child: const Text(
              "No",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              localStorage.write("isLoggedIn", false);
              SystemNavigator.pop();
            },
            child: const Text(
              "Yes",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.green,
              ),
            ),
          ),
        ],
      );
    },
  );
}
