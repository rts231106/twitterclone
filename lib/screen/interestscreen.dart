import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitterclone/constants/gaps.dart';
import 'package:twitterclone/constants/sizes.dart';
import 'package:twitterclone/screen/InterestTwoScreen.dart';
import 'package:twitterclone/widget/CommonButton.dart';
import 'package:twitterclone/widget/InterestButton.dart';
import 'package:twitterclone/widget/appbar.dart';

const interests = [
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

class InterestScreen extends StatefulWidget {
  static String routeName = "/interest";
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final ScrollController _scrollController = ScrollController();
  int _selectedCount = 0;
  final List<String> _selectedInterests = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    if (_selectedInterests.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InterestTwoScreen(
            interests: _selectedInterests,
          ),
        ),
      );
    } else {
      return;
    }
  }

  void _onInterestSelected(String interest, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedCount++;
        _selectedInterests.add(interest);
      } else {
        _selectedCount--;
        _selectedInterests.remove(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Scrollbar(
        controller: _scrollController,
        child: SafeArea(
          child: Padding(
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
                    "Select at least 3 interests to personalize your Twitter experience. they will be bisible on your profile.",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 50,
                    thickness: 0.5,
                  ),
                  Gaps.v24,
                  Center(
                    child: Wrap(
                      runSpacing: Sizes.size16,
                      spacing: Sizes.size10,
                      children: [
                        for (var interest in interests)
                          InterestButton(
                            interest: interest,
                            onSelected: (isSelected) =>
                                _onInterestSelected(interest, isSelected),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: Sizes.size20,
        ),
        height: Sizes.size80,
        surfaceTintColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v2,
              GestureDetector(
                onTap: _selectedCount >= 3 ? _onNextTap : null,
                child: CommonButton(
                  icon: null,
                  text: "Next",
                  blackmode: _selectedCount >= 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
