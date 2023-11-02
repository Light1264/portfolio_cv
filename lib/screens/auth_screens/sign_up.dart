import 'package:flutter/material.dart';
import 'package:portfolio_cv/main.dart';
import '../../controllers/signup_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/auth_textfield.dart';
import 'sign_in.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorConstants.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _signUpController.formFieldKey,
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      imageConstants.myPrimaryLogo,
                      scale: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Let's sign you up",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Are you new here, input your details\nto gain access to my porfolio cv",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthTextField(
                    textFieldController: _signUpController.nameController,
                    labelText: "Username",
                    hintText: "Input your username",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthTextField(
                    textFieldController: _signUpController.passwordController,
                    labelText: "Password",
                    hintText: "Input password",
                    isObsure: _signUpController.isObsecure.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _signUpController.isObsecure.value =
                              !_signUpController.isObsecure.value;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Icon(
                          _signUpController.isObsecure.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: _signUpController.isObsecure.value
                              ? Colors.grey
                              : colorConstants.primaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthTextField(
                    textFieldController:
                        _signUpController.confirmPasswordController,
                    labelText: "Confirm password",
                    hintText: "Confirm password",
                    isObsure: _signUpController.isObscureConfirmPassword.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _signUpController.isObscureConfirmPassword.value =
                              !_signUpController.isObscureConfirmPassword.value;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Icon(
                          _signUpController.isObscureConfirmPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color:
                              _signUpController.isObscureConfirmPassword.value
                                  ? Colors.grey
                                  : colorConstants.primaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppButton(
                    buttonText: "Sign Up",
                    onPressed: () {
                      _signUpController.validation();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already signed up? ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(const SignInScreen());
                        },
                        child: Text(
                          "Sign In",
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
      ),
    );
  }
}
