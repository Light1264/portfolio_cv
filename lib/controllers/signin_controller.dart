import 'package:flutter/material.dart';
import 'package:portfolio_cv/main.dart';
import 'package:portfolio_cv/utils/functions.dart';
import '../core/app_export.dart';
import '../screens/sidebar_menu_screens/profile.dart';
import '../services/app_api_clent.dart';

final apiClient = ApiClient();

class SignInController extends GetxController {
  final ApiClient apiClient = ApiClient();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  var isObscure = true.obs;
  GlobalKey<FormFieldState> formKey = GlobalKey();

  String? errorMessage;
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    nameController.clear();
    passwordController.clear();
  }

  validation() async {
    if (nameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      errorMethod('Email or Password can not be empty');
    } else {
      signIn();
    }
  }

  Future<void> signIn() async {
    try {
      final requestData = {
        'username': nameController.text,
        'pwd': passwordController.text,
      };
      dynamic response = await ApiClient().signIn(requestData: requestData);
      // print("---------- response $response");
      if (response["message"] == "Login Successful") {
        localStorage.write("isLoggedIn", true);

        nameController.clear();
        passwordController.clear();

        Get.off(MyHomePage());
      } else {
        errorMethod('Email or Password Incorrect');
      }
    } catch (e) {
      errorMethod("$e");
    }
  }
}
