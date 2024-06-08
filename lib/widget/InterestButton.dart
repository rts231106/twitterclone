import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterclone/constants/gaps.dart';
import 'package:twitterclone/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
    required this.onSelected,
  });

  final String interest;
  final ValueChanged<bool> onSelected;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;

      widget.onSelected(_isSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size10,
        ),
        alignment: Alignment.bottomLeft,
        width: Sizes.size96 + Sizes.size56,
        height: Sizes.size80,
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.interest,
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                  color: _isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
