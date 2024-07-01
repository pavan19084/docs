import 'package:docs/done.dart';
import 'package:docs/forgot_password.dart';
import 'package:docs/signin.dart';
import 'package:docs/signup.dart';
import 'package:docs/verify.dart';
import 'package:get/get.dart';

class RoutesName {
  static const String signin = "/signin";
  static const String signup = "/signup";
  static const String done = "/done";
  static const String verify = "/verify";
  static const String forgotPassword = "/forgotPassword";
}

class Pages {
  static final pages = [
    GetPage(
      name: RoutesName.signin,
      page: () => const SignIn(),
    ),
    GetPage(
      name: RoutesName.signup,
      page: () => const SignUp(),
    ),
    GetPage(
      name: RoutesName.forgotPassword,
      page: () => const ForgotPassword(),
    ),
    GetPage(
      name: RoutesName.done,
      page: () => const Done(),
    ),
    GetPage(
      name: RoutesName.verify,
      page: () => const EmailVerification(),
    ),
  ];
}
