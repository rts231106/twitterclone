import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:twitterclone/constants/gaps.dart';
import 'package:twitterclone/constants/sizes.dart';
import 'package:twitterclone/widget/CommonButton.dart';
import 'package:twitterclone/widget/LikesButton.dart';
import 'package:twitterclone/widget/appbar.dart';

const likes = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestTwoScreen extends StatefulWidget {
  final List<String> interests;

  const InterestTwoScreen({
    super.key,
    required this.interests,
  });

  @override
  State<InterestTwoScreen> createState() => _InterestTwoScreenState();
}

class _InterestTwoScreenState extends State<InterestTwoScreen> {
  int _selectedCount = 0;

  void _onLikeselected(String like, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedCount++;
      } else {
        _selectedCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v48,
              const Text(
                "What do you want to see on Twitter?",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v20,
              const Text(
                "Likes are used to personalize your experience and will be visible on your profile.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 50,
                thickness: 0.5,
              ),
              Gaps.v12,
              Text(
                widget.interests.isNotEmpty
                    ? widget.interests[0]
                    : 'No interests selected',
                style: const TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Gaps.v16,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: Sizes.size14,
                      children: [
                        for (var like in likes.take(likes.length ~/ 3))
                          LikesButton(
                              like: like,
                              onSelected: (isSelected) =>
                                  _onLikeselected(like, isSelected)),
                      ],
                    ),
                    Gaps.v10,
                    Wrap(
                      spacing: Sizes.size14,
                      children: [
                        for (var like in likes.sublist(
                            likes.length ~/ 3, 2 * likes.length ~/ 3))
                          LikesButton(
                              like: like,
                              onSelected: (isSelected) =>
                                  _onLikeselected(like, isSelected)),
                      ],
                    ),
                    Gaps.v10,
                    Wrap(
                      spacing: Sizes.size14,
                      children: [
                        for (var like in likes.sublist(2 * likes.length ~/ 3))
                          LikesButton(
                              like: like,
                              onSelected: (isSelected) =>
                                  _onLikeselected(like, isSelected)),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 50,
                thickness: 0.5,
              ),
              Gaps.v12,
              Text(
                widget.interests.isNotEmpty
                    ? widget.interests[1]
                    : 'No interests selected',
                style: const TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Gaps.v16,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: Sizes.size14,
                      children: [
                        for (var like in likes.take(likes.length ~/ 3))
                          LikesButton(
                              like: like,
                              onSelected: (isSelected) =>
                                  _onLikeselected(like, isSelected)),
                      ],
                    ),
                    Gaps.v10,
                    Wrap(
                      spacing: Sizes.size14,
                      children: [
                        for (var like in likes.sublist(
                            likes.length ~/ 3, 2 * likes.length ~/ 3))
                          LikesButton(
                              like: like,
                              onSelected: (isSelected) =>
                                  _onLikeselected(like, isSelected)),
                      ],
                    ),
                    Gaps.v10,
                    Wrap(
                      spacing: Sizes.size14,
                      children: [
                        for (var like in likes.sublist(2 * likes.length ~/ 3))
                          LikesButton(
                              like: like,
                              onSelected: (isSelected) =>
                                  _onLikeselected(like, isSelected)),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 50,
                thickness: 0.5,
              ),
              Gaps.v12,
              Text(
                widget.interests.isNotEmpty
                    ? widget.interests[2]
                    : 'No interests selected',
                style: const TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Gaps.v16,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: Sizes.size14,
                      children: [
                        for (var like in likes.take(likes.length ~/ 3))
                          LikesButton(
                              like: like,
                              onSelected: (isSelected) =>
                                  _onLikeselected(like, isSelected)),
                      ],
                    ),
                    Gaps.v10,
                    Wrap(
                      spacing: Sizes.size14,
                      children: [
                        for (var like in likes.sublist(
                            likes.length ~/ 3, 2 * likes.length ~/ 3))
                          LikesButton(
                              like: like,
                              onSelected: (isSelected) =>
                                  _onLikeselected(like, isSelected)),
                      ],
                    ),
                    Gaps.v10,
                    Wrap(
                      spacing: Sizes.size14,
                      children: [
                        for (var like in likes.sublist(2 * likes.length ~/ 3))
                          LikesButton(
                              like: like,
                              onSelected: (isSelected) =>
                                  _onLikeselected(like, isSelected)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        child: CommonButton(
          text: "Next",
          blackmode: _selectedCount >= 3,
          icon: null,
        ),
      ),
    );
  }
}
