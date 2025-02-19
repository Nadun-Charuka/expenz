import 'package:expenz/constant/colors.dart';
import 'package:expenz/data/onboarding_screen_data.dart';
import 'package:expenz/screens/onboarding/front_page.dart';
import 'package:expenz/screens/onboarding/shared_onboarding_screen.dart';
import 'package:expenz/screens/user_data_screen.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool showDetailsPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Always include FrontPage, then add the onboarding screens if available
    int pageCount = OnboardingScreenData.onboardingScreenDataList.length + 1;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        showDetailsPage = index == 3;
                      });
                    },
                    itemCount: pageCount,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // FrontPage is always the first screen
                        return FrontPage();
                      } else {
                        // Load onboarding screens if available
                        final onboardingData = OnboardingScreenData
                            .onboardingScreenDataList[index - 1];

                        return SharedOnboardingScreen(
                          imgUrl: onboardingData.imgUrl,
                          title: onboardingData.title,
                          description: onboardingData.description,
                        );
                      }
                    },
                  ),
                  Container(
                    alignment: Alignment(0, 0.75),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count:
                          OnboardingScreenData.onboardingScreenDataList.length +
                              1,
                      effect: WormEffect(
                        activeDotColor: kMainColor,
                        dotColor: kLightGrey,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: !showDetailsPage
                          ? GestureDetector(
                              onTap: () {
                                _pageController.animateToPage(
                                  _pageController.page!.toInt() + 1,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: CustomButton(
                                buttonName:
                                    showDetailsPage ? "Get Started" : "Next",
                                buttonColor: kMainColor,
                              ),
                            )
                          //navigate to the user data form page
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserDataScreen()),
                                );
                              },
                              child: CustomButton(
                                buttonName:
                                    showDetailsPage ? "Get Started" : "Next",
                                buttonColor: kMainColor,
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
