import 'package:app/models/user.dart';
import 'package:app/pages/home/business_home.dart';
import 'package:app/utils/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/home/member_home.dart';
import 'package:provider/provider.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<UserObject?>();

    if (firebaseUser?.accountType == AccountType.member) {
      return const MemberHomePage();
    }

    return const BusinessHomePage();
  }
}
