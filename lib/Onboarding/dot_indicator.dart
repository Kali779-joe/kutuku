import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int total;

  const DotIndicator({
    super.key,
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(total, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 10,
            width: currentIndex == index ? 20 : 10,
            decoration: BoxDecoration(
              color: currentIndex == index ? Colors.indigo : Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          );
        }),
      ],
    );
  }
}
