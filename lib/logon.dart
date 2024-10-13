import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded( // يستخدم لضبط حجم الصورة بحيث لا تتجاوز المساحة المتاحة
              child: PageView(
                controller: pageController,
                children: [
                  buildOnboardingPage(
                    context,
                    'assets/images/robot.png',
                    'Whispers of the Forest',
                    'The tranquil rustle of leaves tells stories older than time, where every tree holds a secret.',
                  ),
                  buildOnboardingPage(
                    context,
                    'assets/images/ocean.png',
                    'Ocean\'s Eternal Dance',
                    'Waves kiss the shore in a timeless rhythm, a powerful reminder of nature\'s gentle persistence.',
                  ),
                  buildOnboardingPage(
                    context,
                    'assets/images/mountain.png',
                    'Mountains of Majesty',
                    'Standing tall and silent, the mountains inspire awe with their unyielding strength and timeless beauty.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // تباعد بين الصورة والأزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // منطق زر التخطي
                    pageController.jumpToPage(2);
                  },
                  child: Text('skip', style: TextStyle(color: Colors.purple)),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    activeDotColor: Colors.purple,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // منطق زر التالي
                    if (pageController.page! < 2) {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text('next', style: TextStyle(color: Colors.purple)),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // دالة لبناء صفحات الـ Onboarding
  Widget buildOnboardingPage(BuildContext context, String imagePath, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded( // استخدام Expanded لتقييد حجم الصورة
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain, // لضبط الصورة داخل الحاوية
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            description,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
