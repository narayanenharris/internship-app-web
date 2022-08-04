import 'package:app/models/user.dart';
import 'package:app/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/member_signup.dart';
import 'package:app/pages/welcome_page.dart';
import 'package:app/pages/splash_screen.dart';
import 'package:app/pages/business_login.dart';
import 'package:app/pages/business_signup.dart';
import 'package:app/pages/member_login.dart';
import 'package:app/pages/otp_verify.dart';
import 'package:app/pages/authentication_wrapper.dart';
import 'package:app/utils/authentication_service.dart';

late UserObject? userObject;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  userObject = await AuthenticationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(
            FirebaseAuth.instance,
            FirebaseFirestore.instance,
          ),
        ),
        StreamProvider(
          create: (context) {
            return context.read<AuthenticationService>().authStateChanges;
          },
          initialData: userObject,
        )
      ],
      child: MaterialApp(
        title: 'App',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 255, 0, 0),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color.fromARGB(255, 255, 0, 0),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/auth': (context) => const AuthenticationWrapper(),
          '/welcome': (context) => const WelcomePage(),
          '/member-login': (context) => MemberLoginPage(),
          '/member-signup': (context) => MemberSignupPage(),
          '/business-login': (context) => BusinessLoginPage(),
          '/business-signup': (context) => BusinessSignupPage(),
          '/otp-verify': (context) => const OtpVerifyPage(),
          '/home': (context) => const HomePage(),
          '/dashboard': (context) => const DashboardPage(),
        },
      ),
    );
  }
}
