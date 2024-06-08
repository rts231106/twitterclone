import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterclone/constants/gaps.dart';
import 'package:twitterclone/constants/sizes.dart';
import 'package:twitterclone/screen/interestscreen.dart';
import 'package:twitterclone/widget/CommonButton.dart';
import 'package:twitterclone/widget/appbar.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;
  bool _blackMode = false;
  String _password = "";

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  bool _color() {
    if (_password.length == 8) {
      setState(() {
        _blackMode = true;
      });
      return true;
    } else {
      setState(() {
        _blackMode = false;
      });
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

//패스워드 입력 문자 개수 메서
  bool _ispasswordValid() {
    return _password.isNotEmpty && _password.length >= 8;
  }

  void _nextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) =>  InterestScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
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
                  "You'll need a password",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Gaps.v20,
                const Text(
                  "Make sure it's 8 characters or more.",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v32,
                TextField(
                  //비밀번호 * 처럼 보이기
                  obscureText: _obscureText,
                  //자동완성
                  autocorrect: false,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey.shade300,
                            size: Sizes.size20,
                          ),
                        ),
                        _color()
                            ? const FaIcon(
                                Icons.check_circle_outline_sharp,
                                size: Sizes.size24,
                                color: Colors.green,
                              )
                            : const FaIcon(
                                Icons.check_circle_outline_sharp,
                                size: Sizes.size24,
                                color: Colors.white,
                              ),
                      ],
                    ),
                  ),
                ),
                Gaps.v96,
                GestureDetector(
                  onTap: _nextTap,
                  child: CommonButton(
                    text: "Next",
                    blackmode: _color(),
                    icon: null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
