import 'package:flutter/material.dart';
import 'package:portfolio_cv/main.dart';
import '../controllers/signin_controller.dart';
import '../core/app_export.dart';
import '../widgets/auth_textfield.dart';
import 'sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _signInController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorConstants.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _signInController.formFieldKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    imageConstants.myPrimaryLogo,
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Let's sign you in.",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign in to view my porfolio cv and gain more insight of my person and skills",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AuthTextField(
                  textFieldController: _signInController.nameController,
                  labelText: "Username",
                  hintText: "Light",
                ),
                const SizedBox(
                  height: 24,
                ),
                AuthTextField(
                  textFieldController: _signInController.passwordController,
                  labelText: "Password",
                  hintText: "Input password",
                  isObsure: _signInController.isObscure.value,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _signInController.isObscure.value =
                            !_signInController.isObscure.value;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Icon(
                        _signInController.isObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: _signInController.isObscure.value
                            ? Colors.grey
                            : colorConstants.primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AppButton(
                  buttonText: "Sign In",
                  onPressed: () {
                    _signInController.validation();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.off(const SignUpScreen());
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: colorConstants.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
