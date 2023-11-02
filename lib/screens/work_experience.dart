import 'package:flutter/material.dart';
import 'package:portfolio_cv/components/header_text.dart';
import 'package:portfolio_cv/components/header_widget.dart';
import 'package:portfolio_cv/main.dart';
import 'package:portfolio_cv/side_bar.dart';

class WorkExperienceScreen extends StatelessWidget {
  WorkExperienceScreen({
    super.key,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> skillSet1 = [
    "Providers state management",
    "getX",
    "shared preferences",
    "API integration (dio)",
    "Github in collaboration",
    "MVC architecture",
  ];
  final List<String> skillSet2 = [
    "Software development (UI/UX implementation...)",
    "Firebase",
    "RESTFUL API (http)",
    "Team work",
    "Agile development",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorConstants.backgroundColor,
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Work Experience',
            style: TextStyle(
              color: colorConstants.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: colorConstants.backgroundColor,
          elevation: 1,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.menu), // Hamburger icon
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        drawer: SidebarMenu(), // Hide the drawer on larger screens.
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Trusoft Limited - Lagos \nApril 2023 to June 2023",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: colorConstants.appBlack,
                  ),
                ),
                const HeaderText(
                    headerText: "Flutter developer, intern (remote)",
                    content:
                        "I had the opportunity to work fully remote for the first time and I learnt more about time management, working under pressure, communication and working with a team of people I had never met before."),
                const SizedBox(
                  height: 24,
                ),
                HeaderWidget(
                  headerText: "Skills Acquired",
                  length: skillSet1.length,
                  content: skillSet1,
                ),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  "Deebug institute/studio - Benin City \nApril 2022 to April 2023",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: colorConstants.appBlack,
                  ),
                ),
                const HeaderText(
                    headerText: "Flutter developer, intern",
                    content:
                        """I worked as an intern for a year building mobile applications both in-house and for clients where I got first-hand experience in dealing with customers and users and also learnt communication skills
                        \nI was privy to work with a team of developers and was given the award of the best team player of the year. 
                        \nAnd apart from building software, I also taught "mobile applications development with Flutter" to some of their students during my time with them, and also got to work in customer service."""),
                const SizedBox(
                  height: 24,
                ),
                HeaderWidget(
                  headerText: "Skills Acquired",
                  length: skillSet2.length,
                  content: skillSet2,
                )
              ],
            ),
          ),
        ));
  }
}
