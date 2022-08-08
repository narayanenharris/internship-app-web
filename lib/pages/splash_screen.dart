import 'dart:async';
import 'package:flutter/material.dart';

const String loggedInKey = 'LoggedIn';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  void checkAuth() {
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(
        context,
        '/auth',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 237, 29, 36),
                  Color.fromARGB(255, 237, 29, 36),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Image.asset("assets/images/New-logo-red.png"),
          )
        ],
      ),
    );
  }
}
