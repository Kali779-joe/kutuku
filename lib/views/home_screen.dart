import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('HomeScreen')),
          ElevatedButton(
            onPressed: () {
              context.goNamed('AppRouter');
            },
            child: Text('Navigate'),
          ),
        ],
      ),
    );
  }
}
