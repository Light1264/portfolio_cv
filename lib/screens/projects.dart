import 'package:flutter/material.dart';
import 'package:portfolio_cv/components/page_content.dart';
import 'package:portfolio_cv/main.dart';
import 'package:portfolio_cv/side_bar.dart';

import '../components/image_page_content.dart';

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
      description: 'This is the first page.',
    ),
    ImagePageContent(
      imageAsset: imageConstants.aiStoryGenerator,
      title: textConstants.aiStoryGeneratorAppHeader,
      description: 'This is the second page.',
    ),
    ImagePageContent(
      imageAsset: imageConstants.eventPro,
      title: textConstants.eventProAppHeader,
      description: 'This is the third page.',
    ),
    PageContent(title: "", description: "description"),
    PageContent(title: "", description: "description"),
    PageContent(title: "Others", description: "description"),
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
          icon: Icon(Icons.menu), // Hamburger icon
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: SidebarMenu(), // Hide the drawer on larger screens.
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
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (_pageController.page != 0) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (_pageController.page != pages.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
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
