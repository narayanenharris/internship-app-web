import 'package:app/utils/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserObject {
  UserObject({
    required this.email,
    required this.fullName,
    required this.dateOfBirth,
    required this.referralCode,
    required this.accountType,
    required this.userCredential,
  });

  final String email;
  final String fullName;
  final String dateOfBirth;
  final AccountType accountType;
  final String referralCode;
  final User? userCredential;
}
