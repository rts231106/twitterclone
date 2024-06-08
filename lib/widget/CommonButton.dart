import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitterclone/constants/sizes.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final bool blackmode;
  final Icon? icon;

  const CommonButton(
      {super.key,
      required this.text,
      required this.blackmode,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size56,
        vertical: Sizes.size12,
      ),
      decoration: BoxDecoration(
        color: blackmode ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(
          Sizes.size32,
        ),
        border: Border.all(
          color: Colors.grey,
          width: Sizes.size1,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (icon != null)
            Align(
              alignment: Alignment.centerLeft,
              child: icon,
            ),
          const Align(
            alignment: Alignment.centerLeft,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w700,
              color: blackmode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
