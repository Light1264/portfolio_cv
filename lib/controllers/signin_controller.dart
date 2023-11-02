import 'package:flutter/material.dart';
import 'package:portfolio_cv/main.dart';
import 'package:portfolio_cv/screens/home_page.dart';
import 'package:portfolio_cv/utils/functions.dart';
import '../core/app_export.dart';
import '../services/app_api_clent.dart';

final apiClient = ApiClient();

class SignInController extends GetxController {
  final ApiClient apiClient = ApiClient();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  var isObscure = true.obs;
  GlobalKey<FormFieldState> formFieldKey = GlobalKey();

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
      login();
    }
  }

  Future<void> login() async {
    try {
      //final headers = {'Authorization': 'I dont have'};
      print("got here");
      final requestData = {
        'username': nameController.text,
        'pwd': passwordController.text,
      };
      dynamic response = await ApiClient().signIn(requestData: requestData);
      print("---------- response $response");
      if (response["user"]["email"] == nameController.text.trim()) {
        localStorage.write("isLoggedIn", true);

        nameController.clear();
        passwordController.clear();

        Get.off(MyHomePage());
      } else {
        print('fetching failed: $response');
        errorMethod('Email or Password Incorrect');
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }
}
