import 'package:expenz/models/onboarding_screen_model.dart';

class OnboardingScreenData {
  static final List<OnboardingScreenModel> onboardingScreenDataList = [
    OnboardingScreenModel(
      imgUrl: "assets/images/onboard_1.png",
      title: "Gain total control of your money",
      description: "Become your own money manager and make every cent count",
    ),
    OnboardingScreenModel(
      title: "Know where your money goes",
      imgUrl: "assets/images/onboard_2.png",
      description:
          "Track your transaction easily,with categories and financial report ",
    ),
    OnboardingScreenModel(
      title: "Planning ahead",
      imgUrl: "assets/images/onboard_3.png",
      description: "Setup your budget for each category so you in control",
    ),
  ];
}
