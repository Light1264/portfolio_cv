import 'package:flutter/material.dart';
import 'package:portfolio_cv/main.dart';
import 'package:portfolio_cv/screens/certificates.dart';
import 'package:portfolio_cv/screens/home_page.dart';
import 'package:portfolio_cv/screens/projects.dart';
import 'package:portfolio_cv/screens/work_experience.dart';

class SidebarMenu extends StatefulWidget {
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
                      print(selectedIndex);
                      if (index == 0) {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => MyHomePage()),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => ProjectsScreen()),
                          ),
                        );
                      } else if (index == 2) {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => CertificatesScreen()),
                          ),
                        );
                      }
                      else if (index == 3) {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => WorkExperienceScreen()),
                          ),
                        );
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
              onTap: () {},
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
