import 'package:app_maintain/other/color.dart';
import 'package:app_maintain/ui/splash/onboarding/onboarding_page_position.dart';
import 'package:flutter/material.dart';

class OnboardingChildPage extends StatelessWidget {
  final OnboardingPagePosition onboardingPagePosition;
  final VoidCallback skipOnPressed;
  final VoidCallback nextOnPressed;
  final VoidCallback backOnPressed;

  const OnboardingChildPage(
      {super.key,
      required this.onboardingPagePosition,
      required this.nextOnPressed,
      required this.backOnPressed,
      required this.skipOnPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainAppWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSkipButton(),
              _buildOnboardingImage(),
              _buildOnboardingPageControll(),
              _buildOnboardingTitleAndContent(),
              _buildOnboardingNextAndBackButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: [
          const SizedBox(width: 16),
          TextButton(
            child: Text(
              'SKIP',
              style: TextStyle(
                  fontSize: 16, color: blueDark, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              skipOnPressed.call();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingImage() {
    return Image.asset(
      onboardingPagePosition.onboardingPageImage(),
      height: 320,
      width: 320,
      fit: BoxFit.contain,
    );
  }

  Widget _buildOnboardingPageControll() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 4,
            width: 32,
            decoration: BoxDecoration(
                color: onboardingPagePosition == OnboardingPagePosition.page1
                    ? blueDark
                    : greyLightColor,
                borderRadius: BorderRadius.circular(56))),
        Container(
            height: 4,
            width: 32,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: onboardingPagePosition == OnboardingPagePosition.page2
                    ? blueDark
                    : greyLightColor,
                borderRadius: BorderRadius.circular(56))),
        Container(
            height: 4,
            width: 32,
            decoration: BoxDecoration(
                color: onboardingPagePosition == OnboardingPagePosition.page3
                    ? blueDark
                    : greyLightColor,
                borderRadius: BorderRadius.circular(56)))
      ],
    );
  }

  Widget _buildOnboardingTitleAndContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 160,
          ),
          Text(
            onboardingPagePosition.onboardingPageTitel(),
            style: TextStyle(
                color: blueDark, fontWeight: FontWeight.bold, fontSize: 36),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              onboardingPagePosition.onboardingPageContent(),
              style: TextStyle(color: greyLightColor),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOnboardingNextAndBackButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24)
          .copyWith(top: 144, bottom: 24),
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          TextButton(
            onPressed: () {
              backOnPressed.call();
            },
            child: Text('BACK',
                style: TextStyle(fontSize: 16, color: greyLightColor)),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              nextOnPressed.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: blueDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              onboardingPagePosition == OnboardingPagePosition.page3
                  ? 'GET STARTED'
                  : 'NEXT',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
