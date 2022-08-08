import 'package:app/models/user.dart';
import 'package:app/utils/authentication_service.dart';
import 'package:app/widget/drawer_widget/drawer_widget_business.dart';
import 'package:app/widget/drawer_widget/drawer_widget_member.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWrapper extends StatelessWidget {
  const DrawerWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<UserObject?>();

    if (firebaseUser?.accountType == AccountType.member) {
      return const DrawerWidgetMember();
    }

    return const DrawerWidgetBusiness();
  }
}
