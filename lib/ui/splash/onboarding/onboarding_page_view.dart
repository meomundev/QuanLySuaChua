import 'package:app_maintain/ui/splash/onboarding/onboarding_child_page.dart';
import 'package:app_maintain/ui/splash/onboarding/onboarding_page_position.dart';
import 'package:app_maintain/ui/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _pageController,
      children: [
        OnboardingChildPage(
          onboardingPagePosition: OnboardingPagePosition.page1,
          nextOnPressed: () {
            _pageController.jumpToPage(1);
          },
          backOnPressed: () {
            _pageController.jumpToPage(0);
          },
          skipOnPressed: () {
            _onboardingCompleted();
            _goToWelcomePage();
          },
        ),
        OnboardingChildPage(
          onboardingPagePosition: OnboardingPagePosition.page2,
          nextOnPressed: () {
            _pageController.jumpToPage(2);
          },
          backOnPressed: () {
            _pageController.jumpToPage(0);
          },
          skipOnPressed: () {
            _onboardingCompleted();
            _goToWelcomePage();
          },
        ),
        OnboardingChildPage(
          onboardingPagePosition: OnboardingPagePosition.page3,
          nextOnPressed: () {
            _onboardingCompleted();
            _goToWelcomePage();
          },
          backOnPressed: () {
            _pageController.jumpToPage(1);
          },
          skipOnPressed: () {
            _onboardingCompleted();
            _goToWelcomePage();
          },
        ),
      ],
    ));
  }

  void _goToWelcomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      ),
    );
  }

  Future<void> _onboardingCompleted() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('Onboarding completed', true);
    } catch (e) {
      print(e);
      return;
    }
  }
}
