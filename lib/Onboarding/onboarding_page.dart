import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  /// Creates a new a instance[OnboardingPage]
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.9,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: MediaQuery.of(context).size.width * 0.05,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: MediaQuery.of(context).size.width * 0.04,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
