import 'package:flutter/material.dart';
import 'package:twitterclone/constants/gaps.dart';
import 'package:twitterclone/constants/sizes.dart';
import 'package:twitterclone/widget/CommonButton.dart';
import 'package:twitterclone/widget/appbar.dart';

class AccountScreenTwo extends StatelessWidget {
  final String username;
  final String usermail;
  final String userbirthday;

  const AccountScreenTwo({
    super.key,
    required this.username,
    required this.usermail,
    required this.userbirthday,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Column(
            children: [
              Gaps.v24,
              const Center(
                child: Text(
                  "Create Your account",
                  style: TextStyle(
                    fontSize: Sizes.size28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Gaps.v24,
              TextFormField(
                initialValue: username,
                enabled: false,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                decoration: const InputDecoration(
                  suffix: Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ),
                ),
              ),
              TextFormField(
                initialValue: usermail,
                enabled: false,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                decoration: const InputDecoration(
                  suffix: Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ),
                ),
              ),
              TextFormField(
                initialValue: userbirthday,
                enabled: false,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                decoration: const InputDecoration(
                  suffix: Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ),
                ),
              ),
              Gaps.v96,
              Gaps.v60,
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.grey, fontSize: Sizes.size16),
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
              Gaps.v20,
              const CommonButton(
                text: "Sign Up",
                blackmode: true,
                icon: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
