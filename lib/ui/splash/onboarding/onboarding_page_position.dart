enum OnboardingPagePosition { page1, page2, page3 }

extension OnboardingPagePositionExtension on OnboardingPagePosition {
  // image
  String onboardingPageImage() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return "assets/images/logo.png";
      case OnboardingPagePosition.page2:
        return "assets/images/logoApp.jpg";
      case OnboardingPagePosition.page3:
        return "assets/images/logo.png";
    }
  }

  // title
  String onboardingPageTitel() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return "TITLE";
      case OnboardingPagePosition.page2:
        return "QuanLySua Chua";
      case OnboardingPagePosition.page3:
        return "Text Demo";
    }
  }

  // content
  String onboardingPageContent() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return "You can easily search for your favorite tunes here.";
      case OnboardingPagePosition.page2:
        return "Add your favorite songs to the playlist and enjoy your personalized music experience.";
      case OnboardingPagePosition.page3:
        return "Step into a world of melodies and rhythms with us, where every beat resonates with your soul.";
    }
  }
}
