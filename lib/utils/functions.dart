import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_export.dart';

errorMethod(String erorrMsg) {
  return Get.snackbar(
    backgroundColor: Colors.red,
    colorText: Colors.white,
    "Alert",
    erorrMsg,
  );
}

successMethod(String successmsg) {
  return Get.snackbar(
    backgroundColor: Colors.green,
    colorText: Colors.white,
    "Success",
    successmsg,
  );
}

Future<void> openExternalLink(String url) async {
  try {
    Uri encodedURL = Uri.parse(url);
    await launchUrl(encodedURL);
  } catch (e) {
    errorMethod("Could not launch url");
  }
}
