import 'package:app/models/user.dart';
import 'package:app/pages/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/welcome.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<UserObject?>();

    if (firebaseUser != null) {
      if (firebaseUser.userCredential?.phoneNumber == null) {}

      return const BottomBarPage();
    }

    return WelcomePage();
  }
}
