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
                    imageConstants.dartCertificate,
                  ),
                  fit: BoxFit.cover,
                ),
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
                    content: "Umunubo Elo",
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
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    imageConstants.deebugCertificate,
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
                  const HeaderText(
                      headerText:
                          "App Development Using Dart Programming Language",
                      content: "Umunubo Elo"),
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
