import 'dart:async';
import 'package:app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/buttton.dart';
import 'package:app/utils/helper.dart';
import 'package:app/constants/colors.dart';
import 'package:app/utils/authentication_service.dart';

class OtpVerifyPageArguments {
  final UserObject user;
  final String mobile;
  final String password;

  OtpVerifyPageArguments({
    required this.user,
    required this.mobile,
    required this.password,
  });
}

class OtpVerifyPage extends StatefulWidget {
  const OtpVerifyPage({Key? key}) : super(key: key);

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  late AuthenticationService authService;
  late OtpVerifyPageArguments args;
  int seconds = 30;
  String countryCode = '+91';
  String verificationId = '';
  int? resendToken;
  String smsCode = '';
  late Timer timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var modalRoute = ModalRoute.of(context);
      args = modalRoute?.settings.arguments as OtpVerifyPageArguments;
      authService = context.read<AuthenticationService>();
      startTime();
      verifyPhoneNumber();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void startTime() async {
    var duration = const Duration(seconds: 1);
    seconds = 30;

    timer = Timer.periodic(duration, (timer) {
      setState(() {
        if (seconds > 0) {
          seconds = seconds - 1;
        }
      });
    });
  }

  void resendOtp() {
    startTime();
    verifyPhoneNumber();
  }

  void verifyPhoneNumber() async {
    try {
      FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: countryCode + args.mobile,
        timeout: const Duration(seconds: 30),
        forceResendingToken: resendToken,
        verificationCompleted: (PhoneAuthCredential credential) {
          showSnackbar(context, "Auth Completed!");
        },
        verificationFailed: (FirebaseAuthException e) {
          showSnackbar(context, "Auth Failed!");
        },
        codeSent: (String verificationId, int? resendToken) async {
          showSnackbar(context, "OTP Sent!");
          this.verificationId = verificationId;
          this.resendToken = resendToken;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (error) {
      if (!mounted) return;
      showSnackbar(context, error.toString());
    }
  }

  void onSubmit() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await args.user.userCredential?.updatePhoneNumber(credential);
      authService.signIn(email: args.user.email, password: args.password);

      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, "/onboarding", (r) => false);
    } catch (error) {
      String message = authService.handleFirebaseError(error);
      showSnackbar(context, message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.red,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 48.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.0,
                ),
                child: Column(
                  children: [
                    const Text(
                      "Verify OTP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26.0,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                    ),
                    Flexible(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 350),
                        child: const Text(
                          "We have sent an OTP to your mobile number",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    const Text(
                      "Enter 6 Digit PIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    Flexible(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: Pinput(
                          length: 6,
                          validator: (s) =>
                              s?.length == 6 ? null : 'Pin not valid',
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          errorTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          onChanged: (value) => {smsCode = value},
                          cursor: null,
                          defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              backgroundBlendMode: BlendMode.colorBurn,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          showCursor: true,
                          onCompleted: (pin) => onSubmit(),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: seconds == 0 ? resendOtp : null,
                      child: Text(
                        seconds == 0 ? "Resend OTP" : "Resend in $seconds sec",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(32.0),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: onSubmit,
                        style: buttonStyleRed,
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: ColorConstants.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
