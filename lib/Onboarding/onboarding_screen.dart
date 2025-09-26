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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
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
              Flexible(
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  onPressed: () {
                    context.goNamed('signup');
                  },

                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextButton(
                onPressed: () {
                  _finishOnboarding();
                  context.goNamed('login');
                },
                child: Text(
                  'Already Have an Account',
                  style: TextStyle(
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
