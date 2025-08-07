// class cha: Quản lý các page con. Di chuyển qua lại giữa các page con.

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ytb/ui/onboarding/onboarding_child_page.dart';
import 'package:ytb/ui/welcome/welcome_page.dart';
import 'package:ytb/ultils/enums/onboarding_page_postiton.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          //Truyền vào các widget onboarding ở đây
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page1,
            nextOnPressed: () {
              _pageController.jumpToPage(1);
            },
            backOnPressed: () {
              // Logic to go back to the previous page
              print('trang đầu tiên');
            },
            skipOnPressed: () {
              // Logic to skip the onboarding
              _goToWelcomePage();
              _markOnboardingCompleted();
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page2,
            nextOnPressed: () {
              _pageController.jumpToPage(2);
            },
            backOnPressed: () {
              // Logic to go back to the previous page
              _pageController.jumpToPage(0);
            },
            skipOnPressed: () {
              // Logic to skip the onboarding
              _goToWelcomePage();
              _markOnboardingCompleted();
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page3,
            nextOnPressed: () {
              _goToWelcomePage();
              _markOnboardingCompleted();
            },
            backOnPressed: () {
              // Logic to go back to the previous page
              _pageController.jumpToPage(1);
            },
            skipOnPressed: () {
              // Logic to skip the onboarding
              _goToWelcomePage();
              _markOnboardingCompleted();
            },
          ),
        ],
      ),
    );
  }

  void _goToWelcomePage() {
    // Logic to navigate to the welcome page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomePage(
          isFirstTimeInstallApp: true, // or true based on your logic
        ),
      ),
    );
  }

  void _markOnboardingCompleted() async {
    try {
      // Kiểm tra trạng thái onboarding
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('kOnboardingCompleted', true);
    } catch (e) {
      // Xử lý lỗi nếu có
      print(e);
    }
  }
}
