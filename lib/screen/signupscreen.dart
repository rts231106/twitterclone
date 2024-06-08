import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitterclone/constants/gaps.dart';
import 'package:twitterclone/constants/sizes.dart';
import 'package:twitterclone/screen/accountscreen.dart';
import 'package:twitterclone/widget/CommonButton.dart';
import 'package:twitterclone/widget/appbar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Column(
              children: [
                Gaps.v80,
                const Text(
                  "See What's Happening in the world right now.",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gaps.v80,
                const CommonButton(
                  text: "Continue with google",
                  blackmode: false,
                  icon: Icon(
                    Icons.g_mobiledata_rounded,
                    size: Sizes.size32,
                  ),
                ),
                Gaps.v20,
                const CommonButton(
                  text: "Continue with apple",
                  blackmode: false,
                  icon: Icon(
                    Icons.apple,
                    size: Sizes.size32,
                  ),
                ),
                Gaps.v20,
                const Text(
                  "---------------------------------  or   ---------------------------------",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Gaps.v5,
                GestureDetector(
                  onTap: () => _onAccountTap(context),
                  child: const Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                      ),
                      Center(
                        child: CommonButton(
                          text: "Create account",
                          blackmode: true,
                          icon: null,
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.v28,
                Row(
                  children: [
                    const Text(
                      "By signing up, you agree to our",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Text(
                      " Terms,",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Sizes.size16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Privacy Ploicy,",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: Sizes.size16,
                      ),
                    ),
                    const Text(
                      " and",
                      style: TextStyle(fontSize: Sizes.size16),
                    ),
                    Text(
                      " Cookie Use.",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Sizes.size16),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
        ),
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: Row(
          children: [
            const Text(
              "Have an account already?",
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
            Text(
              " Log in",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: Sizes.size16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
