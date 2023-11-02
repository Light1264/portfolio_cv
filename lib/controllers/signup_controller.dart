import 'package:flutter/material.dart';
import 'package:portfolio_cv/utils/functions.dart';
import '../core/app_export.dart';
import '../main.dart';
import '../screens/sidebar_menu_screens/profile.dart';
import '../services/app_api_clent.dart';

final apiClient = ApiClient();

class SignUpController extends GetxController {
  final ApiClient apiClient = ApiClient();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isObscureConfirmPassword = true.obs;
  var isObsecure = true.obs;
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
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      errorMethod('Email or Password can not be empty');
    } else if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      errorMethod('Password and confirm password are not the same');
    } else {
      signUp();
    }
  }

  Future<void> signUp() async {
    try {
      print("got here");
      final requestData = {
        'username': nameController.text,
        'pwd': passwordController.text,
      };
      dynamic response = await ApiClient().signUp(requestData: requestData);
      print("---------- response $response");
      if (response["success"].toString().contains("New")) {
        localStorage.write("isLoggedIn", true);

        nameController.clear();
        passwordController.clear();

        Get.off(MyHomePage());
      } else {
        errorMethod('Email or Password Incorrect');
      }
    } catch (e) {
      errorMethod('$e');
    }
  }
}
