import 'package:app/models/user.dart';
import 'package:app/pages/home/home_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/welcome_page.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<UserObject?>();

    if (firebaseUser != null) {
      return const HomeWrapper();
    }

    return const WelcomePage();
  }
}
