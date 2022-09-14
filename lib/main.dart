import 'package:app/pages/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/pages/auth/member/member_signup.dart';
import 'package:app/pages/clubs_and_association.dart';
import 'package:app/pages/welcome.dart';
import 'package:app/pages/auth/member/member_login.dart';
import 'package:app/pages/auth/business/business_login.dart';
import 'package:app/pages/auth/business/business_signup.dart';
import 'package:app/models/user.dart';
import 'package:app/pages/dashboard.dart';
import 'package:app/pages/splash_screen.dart';
import 'package:app/pages/subscription.dart';
import 'package:app/pages/auth/otp_verify.dart';
import 'package:app/pages/auth/authentication_wrapper.dart';
import 'package:app/pages/profile.dart';
import 'package:app/constants/colors.dart';
import 'package:app/pages/onboarding/onboarding_wrapper.dart';
import 'package:app/utils/authentication_service.dart';

late UserObject? userObject;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAFrcYJ4E7-UInmmBpFzCGG_0s2fELiOZA",
        authDomain: "mill-1928f.firebaseapp.com",
        projectId: "mill-1928f",
        storageBucket: "mill-1928f.appspot.com",
        messagingSenderId: "85894204754",
        appId: "1:85894204754:web:2ed746a83253935985be8b",
        measurementId: "G-FHVPR6CZ54"),
  );
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
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: ColorConstants.red,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: ColorConstants.red,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => WelcomePage(),
          '/Splash': (context) => const SplashScreen(),
          '/auth': (context) => const AuthenticationWrapper(),
          '/member-login': (context) => MemberLoginPage(),
          '/member-signup': (context) => MemberSignupPage(),
          '/business-login': (context) => BusinessLoginPage(),
          '/business-signup': (context) => BusinessSignupPage(),
          '/otp-verify': (context) => const OtpVerifyPage(),
          '/onboarding': (context) => const OnboardingWrapper(),
          '/bottom-bar': (context) => const BottomBarPage(),
          '/dashboard': (context) => const DashboardPage(),
          '/profile': (context) => ProfilePage(),
          '/subscription': (context) => const SubscriptionPage(),
          '/clubs-associations': (context) => const ClubsAndAssociationsPage(),
        },
      ),
    );
  }
}
