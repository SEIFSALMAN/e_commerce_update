class OnboardingContent {
  String image;
  String title;

  OnboardingContent({required this.image, required this.title});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'Browse the menu \n and order directly from \n the application',
      image: 'assets/images/onboarding/onboarding1.png',

  ),
  OnboardingContent(
      title: 'Your order will be \n immediately collected and \n send by our courier',
      image: 'assets/images/onboarding/onboarding2.png',
      ),
  OnboardingContent(
      title: 'Pick up delivery \n at your door and\n enjoy groceries',
      image: 'assets/images/onboarding/onboarding3.png',
     ),
];