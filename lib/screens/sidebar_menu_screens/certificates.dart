import 'package:flutter/material.dart';
import 'package:portfolio_cv/components/header_text.dart';
import 'package:portfolio_cv/main.dart';
import 'package:portfolio_cv/side_bar.dart';

class CertificatesScreen extends StatelessWidget {
  CertificatesScreen({
    super.key,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorConstants.backgroundColor,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Certificates',
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
      drawer: const SidebarMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Image.asset(
                imageConstants.dartCertificate,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderText(
                    headerText:
                        "App Development Using Dart Programming Language",
                    content: "Alison.com",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Image.asset(
                imageConstants.deebugCertificate,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderText(
                      headerText: "Cross Platform Mobile Application Developer",
                      content: "Deebug Institute"),
                  SizedBox(
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
