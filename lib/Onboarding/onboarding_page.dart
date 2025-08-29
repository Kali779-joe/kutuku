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
        Image.asset(image, fit: BoxFit.cover, height: 500, width: 800),
        SizedBox(height: 15),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
