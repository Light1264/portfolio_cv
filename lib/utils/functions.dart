import 'package:flutter/material.dart';

import '../core/app_export.dart';

errorMethod(String erorrMsg) {
  return Get.snackbar(
    backgroundColor: Colors.red,
    colorText: Colors.white,
    "Error Occured",
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
