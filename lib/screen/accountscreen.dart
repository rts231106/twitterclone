import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitterclone/constants/gaps.dart';
import 'package:twitterclone/constants/sizes.dart';
import 'package:twitterclone/screen/custommizescreen.dart';
import 'package:twitterclone/widget/appbar.dart';
import 'package:twitterclone/widget/nextbutton.dart';

class AccountScreen extends StatefulWidget {
  static String routeName = "/create_account";
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final Map<String, String> _formdata = {};
  final TextEditingController _BirthdayController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  DateTime initialDate = DateTime.now();
  String _username = "";
  String _usermail = "";
  String _userbirthday = "";

  @override
  void initState() {
    super.initState();

    _setTextFieldDate(initialDate);

    _nameController.addListener(() {
      setState(() {
        _username = _nameController.text;
      });
    });

    _emailController.addListener(() {
      setState(() {
        _username = _nameController.text;
        _usermail = _emailController.text;
        _userbirthday = _BirthdayController.text;
      });
    });

    _BirthdayController.addListener(() {
      setState(() {
        _userbirthday = _BirthdayController.text;
      });
    });
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(' ').first;
    _BirthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  void dispose() {
    _BirthdayController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onSubmitTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CustomMizeScreen(
          userbirthday: _userbirthday,
          usermail: _usermail,
          username: _username,
        ),
      ),
    );
  }

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
                controller: _nameController,
                decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    hintText: 'Name',
                    suffix: Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    )),
                cursorColor: Theme.of(context).primaryColor,
                //text 스타일
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                //form에서는 유효성 검증
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    _formdata['name'] = newValue;
                  }
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    hintText: 'Email',
                    suffix: Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    )),
                cursorColor: Theme.of(context).primaryColor,
                //text 스타일
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                //form에서는 유효성 검증
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    _formdata['Email'] = newValue;
                  }
                },
              ),
              TextFormField(
                //입력을 비활성화
                enabled: false,
                controller: _BirthdayController,
                decoration: const InputDecoration(
                  //텍스트 박스를 클릭안했을때
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  //텍스트 박스를 클릭할때
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    _formdata['Birthday'] = newValue;
                  }
                },
              ),
              Gaps.v10,
              const Text(
                "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Gaps.v96,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: _onSubmitTap,
                    child: nextButton(
                      disable: _username.isEmpty && _usermail.isEmpty,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: BottomAppBar(
          surfaceTintColor: Colors.white,
          height: 200,
          child: SizedBox(
            height: 300,
            child: CupertinoDatePicker(
              backgroundColor: Colors.white,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: _setTextFieldDate,
            ),
          ),
        ),
      ),
    );
  }
}
