import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quotes/screens/login_and_signup/login_screen.dart';

class splashIntro {
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const loginScreen(),
            )));
  }
}
