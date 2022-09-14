import 'package:app/web_widgets/bottom_bar.dart';
import 'package:app/web_widgets/carousel.dart';
import 'package:app/web_widgets/featured_heading.dart';
import 'package:app/web_widgets/featured_tiles.dart';
import 'package:app/web_widgets/floating_quick_access.dart';
import 'package:app/web_widgets/main_heading.dart';
import 'package:app/web_widgets/top_bar_contents.dart';
import 'package:app/web_widgets/top_carousel.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: screenSize.width < 800
          ? AppBar()
          : PreferredSize(
              preferredSize: Size(screenSize.width, 70),
              child: TopBarContents(_opacity),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: screenSize.height * 0.65,
                    width: screenSize.width * 0.3,
                    child: Image.asset(
                      'assets/images/New-logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(children: [
                  FloatingQuickAccessBar(screenSize: screenSize),
                  MainCarousel2(),
                  FeaturedHeading(screenSize: screenSize),
                  FeaturedTiles(screenSize: screenSize),
                  MainHeading(screenSize: screenSize),
                  SizedBox(
                    height: screenSize.height / 10,
                  ),
                  const BottomBar(),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
