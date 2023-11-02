import 'package:flutter/material.dart';
import 'package:portfolio_cv/components/header_widget.dart';
import 'package:portfolio_cv/components/page_content.dart';
import 'package:portfolio_cv/main.dart';
import 'package:portfolio_cv/side_bar.dart';

import '../../components/image_page_content.dart';
import '../../core/app_export.dart';
import '../../widgets/web_view.dart';

class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({
    super.key,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> pages = [
    ImagePageContent(
      imageAsset: imageConstants.hockeyGameApp,
      title: textConstants.hockeyGameAppHeader,
      description: textConstants.hockeyGameAppDescription,
      textFunction: () {
        Get.to(const ExploreWebview(
          title: 'Terms of Service',
          url: "https://github.com/hngx-org/team-giant-hockey",
        ));
      },
    ),
    ImagePageContent(
      imageAsset: imageConstants.aiStoryGenerator,
      title: textConstants.aiStoryGeneratorAppHeader,
      description: textConstants.aiStoryGeneratorAppDescription,
      textFunction: () {
        Get.to(const ExploreWebview(
          title: 'Terms of Service',
          url: "https://github.com/hngx-org/ai-story-generator",
        ));
      },
    ),
    ImagePageContent(
      imageAsset: imageConstants.eventPro,
      title: textConstants.eventProAppHeader,
      description: textConstants.eventProAppDescription,
      textFunction: () {
        Get.to(const ExploreWebview(
          title: 'Terms of Service',
          url: "https://github.com/Light1264/EventPro/tree/master",
        ));
      },
    ),
    PageContent(
      title: textConstants.fortcoreAppHeader,
      companyName: "Trusoft Limited - Lagos",
      description: textConstants.fortcoreAppDescription,
      isPickload: false,
    ),
    PageContent(
      title: textConstants.pickloadAppHeader,
      companyName: "Deebug institute/studio - Benin City",
      description: textConstants.pickloadAppDescription,
    ),
    HeaderWidget(
      headerText: textConstants.otherAppsHeader,
      length: textConstants.otherApps.length,
      content: textConstants.otherApps,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorConstants.backgroundColor,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Projects',
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
          icon: const Icon(Icons.menu), // Hamburger icon
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: const SidebarMenu(), // Hide the drawer on larger screens.
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: colorConstants.primaryColor,
                    size: 30,
                  ),
                  onPressed: () {
                    if (_pageController.page != 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: colorConstants.primaryColor,
                    size: 30,
                  ),
                  onPressed: () {
                    if (_pageController.page != pages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
