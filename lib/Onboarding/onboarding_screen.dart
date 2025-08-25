import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kutuku/Onboarding/dot_indicator.dart';
import 'package:kutuku/Onboarding/onboarding_data.dart';
import 'package:kutuku/Onboarding/onboarding_page.dart';
import 'package:kutuku/router/app_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChange(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _finishOnboarding() {
    context.go(AppRouter.signup);
    context.go(AppRouter.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(onboardingData.length - 1);
                  },
                  child: Text('Skip', style: TextStyle(color: Colors.indigo)),
                ),
              ),
              //PageView
              Expanded(
                child: PageView.builder(
                  onPageChanged: _onPageChange,
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    final data = onboardingData[index];
                    return OnboardingPage(
                      image: data['image']!,
                      title: data['title']!,
                      description: data['description']!,
                    );
                  },
                ),
              ),
              //Dots indicators
              DotIndicator(
                currentIndex: _currentPage,

                total: onboardingData.length,
              ),
              const SizedBox(height: 20),
              //next button
              if (_currentPage == onboardingData.length - 1)
                ElevatedButton(
                  onPressed: () {
                    _finishOnboarding();
                    context.go('/home');
                  },
                  child: Text('Get started'),
                )
              else
                TextButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text('next'),
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
