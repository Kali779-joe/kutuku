import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    child: Image.asset('assets/image/1slide.png'),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Various Collection of the Latest product',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Urna amet,suspendisse ullamcorper ac elit diam facilisis cursus vestibulum',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      context.goNamed('signup');
                    },

                    child: Text('Create Account'),
                  ),
                ),
                SizedBox(height: 10, width: 10),
                TextButton(
                  onPressed: () {
                    context.goNamed('login');
                  },
                  child: Text('Already Have an Account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
