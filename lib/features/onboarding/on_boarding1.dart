import 'package:ecommerce_homehaven/features/home/widget/onboarding_page.dart';
import 'package:flutter/material.dart';

class FirstOnBoarding extends StatefulWidget {
  const FirstOnBoarding();

  @override
  _FirstOnBoardingState createState() => _FirstOnBoardingState();
}

class _FirstOnBoardingState extends State<FirstOnBoarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    const OnboardingPage(
      title: "Online Home Store and Furniture",
      description:
          "Onboard and branded online store furniture, digital retail, studio, and non-from digital homeware power unit",
      imagePath: "assets/images/Mask group.png",
    ),
    const OnboardingPage(
      title: "Delivery Right to Your Doorstep",
      description:
          "In touch, on the front of our website or for all areas creating your order to your doorstep.",
      imagePath: "assets/images/Mask group-1.png",
    ),
    const OnboardingPage(
      title: "Get Support From Our Skilled Team",
      description:
          "Floor products can make their expectations more accessible. For no warranty use.",
      imagePath: "assets/images/meeting.png",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (_, index) => _pages[index],
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => _buildPageIndicator(index),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.pushReplacementNamed(context, '/login');
                        }
                      },
                      child: Text(
                        _currentPage == _pages.length - 1
                            ? "Get Started"
                            : "Next",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
