import 'package:expenzo_app/helper/app_assets.dart';
import 'package:expenzo_app/helper/colors.dart';
import 'package:expenzo_app/models/onboarding_model.dart';
import 'package:expenzo_app/views/home_view.dart';
import 'package:flutter/material.dart';

import '../helper/text_style.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  late PageController _pageController;
  int currentIndex = 0;
  List<OnboardingModel> onboardingPage = [
    OnboardingModel(
      image: AppAssets.onboardingImage1,
      title: "Take Control of Your Finances",
      subTitle1: "Empower yourself financially with Expenzo!",
      subTitle2:
          "Our intuitive app makes it easy to track your income, expenses, and budget - all in one place.",
    ),
    OnboardingModel(
      image: AppAssets.onboardingImage2,
      title: "Budgeting Made Simple",
      subTitle1:
          "We help you categorize your spending, identify areas to save, and stay on top of your financial goals.",
      subTitle2: '',
    ),
    OnboardingModel(
      image: AppAssets.onboardingImage3,
      title: 'Categorize, Save, Succeed',
      subTitle1:
          'Expenzo helps you organize your expenses, find saving opportunities, and reach your goals faster.',
      subTitle2: '',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
                },
                child: const Text("Skip", style: TextStyles.skipStyle),
              ),
            ),
            const SizedBox(height: 17),
            SizedBox(
              height: 540,
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPage.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        onboardingPage[index].image,
                        width: 366,
                        height: 353,
                      ),
                      const SizedBox(height: 17),
                      Text(
                        textAlign: TextAlign.center,
                        onboardingPage[index].title,
                        style: TextStyles.titleOnboardingStyle,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        textAlign: TextAlign.center,
                        onboardingPage[index].subTitle1,
                        style: TextStyles.subTitleOnboardingStyle,
                      ),
                      const SizedBox(height: 16),
                      if (onboardingPage[index].subTitle2!.isNotEmpty)
                        Text(
                          onboardingPage[index].subTitle2!,
                          style: TextStyles.subTitleOnboardingStyle,
                          textAlign: TextAlign.center,
                        ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(onboardingPage.length, (index) {
                  return AnimatedContainer(
                    duration:const Duration(milliseconds: 200),
                    width: currentIndex == index ? 50 : 25,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? kPrimaryColor
                          : const Color(0xffDDDDDD),
                      borderRadius: BorderRadius.circular(16),
                      shape: BoxShape.rectangle,
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 54),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize:const Size(361, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: kPrimaryColor,
              ),
              onPressed: () {
                if (currentIndex < onboardingPage.length - 1) {
                  _pageController.nextPage(
                    duration:const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
                }
              },
              child: Text(
                currentIndex == onboardingPage.length - 1
                    ? 'Start tracking your money!'
                    : 'Continue',
                style: TextStyles.buttonOnboardingStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
