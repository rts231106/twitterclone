import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterclone/constants/sizes.dart';

class LikesButton extends StatefulWidget {
  const LikesButton({
    super.key,
    required this.like,
    required this.onSelected,
  });
  final String like;
  final ValueChanged<bool> onSelected;

  @override
  State<LikesButton> createState() => _LikesButtonState();
}

class _LikesButtonState extends State<LikesButton> {
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
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 200,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size24,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size32),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        child: Text(
          widget.like,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size16,
            color: _isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
