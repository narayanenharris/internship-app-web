import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingBusiness extends StatefulWidget {
  const OnBoardingBusiness({Key? key}) : super(key: key);

  @override
  State<OnBoardingBusiness> createState() => _OnBoardingBusinessState();
}

class _OnBoardingBusinessState extends State<OnBoardingBusiness> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 60),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 5);
            },
            children: [
              Center(
                child: Image.asset(
                  "assets/images/v_1.jpg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/images/v_2.jpg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/images/v_3.jpg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/images/v_4.jpg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/images/v_5.jpg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/images/v_6.jpg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    primary: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    minimumSize: const Size.fromHeight(60)),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('show', true);
                  if (!mounted) return;
                  Navigator.pushNamed(context, '/home');
                },
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => controller.jumpToPage(5),
                      child: const Text(
                        "SKIP",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 6,
                        effect: const WormEffect(
                          activeDotColor: Color.fromARGB(255, 255, 0, 0),
                          dotColor: Colors.black,
                          spacing: 16,
                        ),
                        onDotClicked: ((index) => controller.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            )),
                      ),
                    ),
                    TextButton(
                      onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                      child: const Text(
                        "NEXT",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
      );
}
