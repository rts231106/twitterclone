import 'package:go_router/go_router.dart';
import 'package:twitterclone/screen/InterestTwoScreen.dart';
import 'package:twitterclone/screen/PasswordScreen.dart';
import 'package:twitterclone/screen/accountscreen.dart';
import 'package:twitterclone/screen/interestscreen.dart';
import 'package:twitterclone/screen/signupscreen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: SignUpScreen.routeName,
    builder: (context, state) => const SignUpScreen(),
  ),
  GoRoute(
    path: AccountScreen.routeName,
    builder: (context, state) => const AccountScreen(),
  ),
  GoRoute(
    path: InterestScreen.routeName,
    builder: (context, state) => const InterestScreen(),
  ),
  GoRoute(
    path: PasswordScreen.routeName,
    builder: (context, state) => const PasswordScreen(),
  ),
]);