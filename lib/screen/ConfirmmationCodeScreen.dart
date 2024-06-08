import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterclone/constants/gaps.dart';
import 'package:twitterclone/constants/sizes.dart';
import 'package:twitterclone/screen/PasswordScreen.dart';
import 'package:twitterclone/widget/CommonButton.dart';
import 'package:twitterclone/widget/appbar.dart';
import 'package:twitterclone/widget/dashUnderline.dart';

class ConfirmmationCodeScreen extends StatefulWidget {
  const ConfirmmationCodeScreen({super.key});

  @override
  State<ConfirmmationCodeScreen> createState() =>
      _ConfirmmationCodeScreenState();
}

class _ConfirmmationCodeScreenState extends State<ConfirmmationCodeScreen> {
  final TextEditingController _codeController = TextEditingController();

  String _code = "";
  bool _blackMode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _codeController.addListener(() {
      setState(() {
        _code = _codeController.text;
      });
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  bool _color() {
    if (_code.length == 5) {
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

  void _onNextTap() {
    if (_code.length == 5) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const PasswordScreen()),
      );
    }
    return;
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
                  "We sent you a code",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Gaps.v16,
                const Text(
                  "Enter it velow to verify",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: Sizes.size20,
                  ),
                ),
                const Text(
                  "jhon.mobbin@gmail.com",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: Sizes.size20,
                  ),
                ),
                Gaps.v20,
                DashedUnderline(
                  child: TextField(
                    controller: _codeController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: Sizes.size3,
                      ),
                      isDense: false,
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: Sizes.size24,
                      letterSpacing: Sizes.size52,
                    ),
                    maxLength: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Gaps.v28,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _color()
                        ? const FaIcon(
                            Icons.check_circle_outline_sharp,
                            size: 32,
                            color: Colors.green,
                          )
                        : const FaIcon(
                            Icons.check_circle_outline_sharp,
                            size: 32,
                            color: Colors.white,
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
          vertical: 0,
          horizontal: Sizes.size20,
        ),
        height: Sizes.size80,
        surfaceTintColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Didn't receive email?",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              Gaps.v2,
              GestureDetector(
                onTap: _onNextTap,
                child: CommonButton(
                  icon: null,
                  text: "Next",
                  blackmode: _color(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
