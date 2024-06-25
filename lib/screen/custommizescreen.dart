import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitterclone/constants/gaps.dart';
import 'package:twitterclone/constants/sizes.dart';
import 'package:twitterclone/screen/accountscreentwo.dart';
import 'package:twitterclone/widget/CommonButton.dart';
import 'package:twitterclone/widget/appbar.dart';

class CustomMizeScreen extends StatefulWidget {
  
  final String username;
  final String usermail;
  final String userbirthday;

  const CustomMizeScreen({
    super.key,
    required this.username,
    required this.usermail,
    required this.userbirthday,
  });
  @override
  State<CustomMizeScreen> createState() => _CustomMizeScreenState();
}

class _CustomMizeScreenState extends State<CustomMizeScreen> {
  void _onCheckTap() {
    setState(() {});
    check = !check;
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AccountScreenTwo(
          userbirthday: widget.userbirthday,
          usermail: widget.usermail,
          username: widget.username,
        ),
      ),
    );
  }

  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size28,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v32,
            const Text(
              "Customize your experience",
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.w900,
              ),
            ),
            Gaps.v20,
            const Text(
              "Track where you see Twitter content across the web",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v16,
            Row(
              children: [
                const SizedBox(
                  width: 230,
                  child: Text(
                    "Twitter uses this data to personalize your experience. this web vrowsing history will never be stored with your name, email,or phone number.",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Gaps.h24,
                GestureDetector(
                  onTap: _onCheckTap,
                  child: SizedBox(
                    child: check
                        ? const Icon(
                            Icons.radio_button_checked_sharp,
                            size: Sizes.size32,
                          )
                        : const Icon(
                            Icons.radio_button_off_sharp,
                            size: Sizes.size32,
                          ),
                  ),
                )
              ],
            ),
            Gaps.v20,
            RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.grey),
                children: <TextSpan>[
                  TextSpan(
                    text: 'By signing up , you agree to our',
                  ),
                  TextSpan(
                    text: 'Terms, Privacy Policy',
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(
                    text: ", and",
                  ),
                  TextSpan(
                    text: 'Cookie Use',
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(
                    text:
                        ' Twitter may use your contact information, including your',
                  ),
                  TextSpan(
                      text:
                          ' address and phone number for purposes outlined in our Privacy Policy. '),
                  TextSpan(
                    text: 'Learn more',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            Gaps.v96,
            GestureDetector(
              onTap: _onNextTap,
              child: CommonButton(
                text: "Next",
                blackmode: check,
                icon: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
