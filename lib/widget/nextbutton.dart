import 'package:flutter/material.dart';
import 'package:twitterclone/constants/sizes.dart';

class nextButton extends StatelessWidget {
  final bool disable;
  const nextButton({super.key, required this.disable});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size10,
        horizontal: Sizes.size16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: disable ? Colors.grey.shade100 : Colors.black,
      ),
      duration: const Duration(
        seconds: 1,
      ),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(seconds: 0),
        style: TextStyle(
          color: disable ? Colors.grey : Colors.white,
          fontWeight: FontWeight.w600,
        ),
        child: const Text(
          'Next',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
