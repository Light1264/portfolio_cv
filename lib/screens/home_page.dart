import 'package:flutter/material.dart';
import 'package:portfolio_cv/components/header_text.dart';
import 'package:portfolio_cv/components/header_widget.dart';
import 'package:portfolio_cv/main.dart';
import 'package:portfolio_cv/side_bar.dart';
import 'package:portfolio_cv/widgets/web_view.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({
    super.key,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> skills = [
    "Leadership",
    "UI/UX design",
    "Communication skills",
    "Meticulous in replicating designs",
    "Product management",
    "Version Control (GitHub)",
    "API Integration",
  ];
  final List<String> contactAddress = [
    "+2348 130 439 834",
    "umunubo.lg@gmail.com",
  ];
  final List<Icon> contactAddressIcons = [
    Icon(Icons.phone_outlined),
    Icon(Icons.mail_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorConstants.backgroundColor,
      key: _scaffoldKey,

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
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
          icon: const Icon(
            Icons.menu,
            size: 30,
          ), // Hamburger icon
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: SidebarMenu(), // Hide the drawer on larger screens.
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    imageConstants.profilePic,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderText(headerText: "Name", content: "Umunubo Elo"),
                  const SizedBox(
                    height: 24,
                  ),
                  const HeaderText(
                    headerText: "Bio",
                    content:
                        "I am a Software Engineer driven by a passion for tackling challenging problems and creating innovative software solutions. I thrive on overcoming obstacles and I am committed to continuous growth. I have an insatiable appetite for learning new skills and I am eager to explore fresh opportunities.",
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HeaderWidget(
                    hasIcon: false,
                    headerText: "Contact Address",
                    length: contactAddress.length,
                    content: contactAddress,
                    iconList: contactAddressIcons,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HeaderWidget(
                    headerText: "Skills",
                    length: skills.length,
                    content: skills,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ExploreWebview(
                                  title: 'Terms of Service',
                                  url:
                                      "https://www.linkedin.com/in/elo-umunubo-236567238/"
                                  // "https://github.com/Light1264",
                                  ),
                            ),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            // color: Colors.blue
                          ),
                          child: Image.asset(imageConstants.linkedinLogo),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ExploreWebview(
                                title: 'Terms of Service',
                                url: "https://github.com/Light1264",
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            // color: Colors.blue
                          ),
                          child: Image.asset(imageConstants.githubLogo),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
