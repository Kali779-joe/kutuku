import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        Image.asset(image, fit: BoxFit.cover, height: 400, width: 600),
        const SizedBox(height: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              context.goNamed('signup');
            },

            child: Text(
              'Create Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        SizedBox(height: 10, width: 10),
        TextButton(
          onPressed: () {
            context.goNamed('login');
          },
          child: Text(
            'Already Have an Account',
            style: TextStyle(color: Colors.indigoAccent),
          ),
        ),
      ],
    );
  }
}
