import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:portfolio_cv/screens/auth_screens/sign_in.dart';
import 'package:portfolio_cv/utils/text_constants.dart';

import 'core/app_export.dart';
import 'screens/sidebar_menu_screens/profile.dart';
import 'services/network_info.dart';

ColorConstants colorConstants = ColorConstants();
ImageConstants imageConstants = ImageConstants();
TextConstants textConstants = TextConstants();
final localStorage = GetStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // Create an instance of Connectivity
  final connectivity = Connectivity();
  // Register NetworkInfo with the Connectivity instance
  final networkInfo = NetworkInfo(connectivity);
  Get.put(networkInfo);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio CV',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: colorConstants.primaryColor),
        useMaterial3: true,
      ),
      home: localStorage.read("isLoggedIn") == true
          ? MyHomePage()
          : const SignInScreen(),
    );
  }
}
