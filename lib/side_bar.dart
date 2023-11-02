import 'package:flutter/material.dart';
import 'package:portfolio_cv/main.dart';
import 'package:portfolio_cv/screens/sidebar_menu_screens/certificates.dart';
import 'package:portfolio_cv/screens/sidebar_menu_screens/projects.dart';
import 'package:portfolio_cv/screens/sidebar_menu_screens/work_experience.dart';
import 'package:portfolio_cv/widgets/dialog_widget.dart';

import 'core/app_export.dart';
import 'screens/sidebar_menu_screens/profile.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key});

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  List<String> sideBarOptions = [
    "Profile",
    "Projects",
    "Certificates",
    "Work Experience",
  ];

  List<Icon> sideBarIcons = [
    Icon(
      Icons.person_3_outlined,
      color: colorConstants.appWhite,
    ),
    Icon(
      Icons.app_shortcut_outlined,
      color: colorConstants.appWhite,
    ),
    Icon(
      Icons.my_library_books_outlined,
      color: colorConstants.appWhite,
    ),
    Icon(
      Icons.work_history_outlined,
      color: colorConstants.appWhite,
    ),
  ];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colorConstants.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset(imageConstants.myLogo),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: sideBarOptions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    onTap: () {
                      // Handle navigation to the home screen.
                      setState(() {
                        selectedIndex = index;
                      });
                      if (index == 0) {
                        Get.off(MyHomePage());
                      } else if (index == 1) {
                        Get.off(ProjectsScreen());
                      } else if (index == 2) {
                        Get.off(CertificatesScreen());
                      } else if (index == 3) {
                        Get.off(WorkExperienceScreen());
                      }
                    },
                    leading: sideBarIcons[index],
                    title: Text(
                      sideBarOptions[index],
                      style: TextStyle(
                        color: selectedIndex == index
                            ? colorConstants.primaryColor
                            : colorConstants.appWhite,
                        fontSize: 23,
                      ),
                    ),
                    tileColor: selectedIndex == index
                        ? colorConstants.backgroundColor
                        : Colors.transparent,
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              leading: RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.logout,
                  color: colorConstants.appWhite,
                ),
              ),
              title: Text(
                'Log Out',
                style: TextStyle(
                  color: colorConstants.appWhite,
                  fontSize: 23,
                ),
              ),
              onTap: () {
                showMyDialog(
                  context,
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
