import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttercommerce/src/di/app_injector.dart';
import 'package:fluttercommerce/src/notifiers/account_provider.dart';

class AuthRepository {
  var firebaseAuth = FirebaseAuth.instance;
  var accountProvider = AppInjector.get<AccountProvider>();
  final databaseReference = Firestore.instance;

  Future<bool> sendCode(
    String phoneNumber, {
    @required PhoneVerificationCompleted verificationCompleted,
    @required PhoneVerificationFailed verificationFailed,
    @required PhoneCodeSent codeSent,
    @required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  }) async {
    try {
      return firebaseAuth
          .verifyPhoneNumber(
              phoneNumber: "+94$phoneNumber",
              timeout: Duration(seconds: 60),
              verificationCompleted: verificationCompleted,
              verificationFailed: verificationFailed,
              codeSent: codeSent,
              codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
          .then((value) {
        return true;
      }).catchError((e) {
        return false;
      });
    } on PlatformException {
      return false;
    }
  }

  setAccountDetails({String displayName, String photoUrl}) async {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = displayName;
    updateInfo.photoUrl = photoUrl;
    (await getCurrentUser()).updateProfile(updateInfo).then((value) async {
      accountProvider.firebaseUser = await getCurrentUser();
    });
  }

  Future<String> getUid() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    return user.uid;
  }

  Future<String> getPhoneNumber() async {
    return (await firebaseAuth.currentUser()).phoneNumber;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    return user;
  }

  Future logoutUser() async {
    return firebaseAuth.signOut();
  }

  Future<bool> checkUserLoggedInStatus() async {
    try {
      FirebaseUser user = await getCurrentUser();
      if (user == null) {
        return false;
      } else
        return true;
    } catch (e) {
      return false;
    }
  }

  Future signUpWithEmail(String email, String password) async {
    try {
      print(email + " - " + password);
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((data) {
        print(data.user.uid);
        //createRecord(data.user.uid, '', email, password);
      }).catchError((onError) {
        if (onError is PlatformException) {
          if (onError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
            print("ERROR_INVALID_EMAIL");
          }
          if (onError.code == 'ERROR_INVALID_EMAIL') {
            print("ERROR_INVALID_EMAIL");
          }
          if (onError.code == 'ERROR_WEAK_PASSWORD') {
            print("ERROR_WEAK_PASSWORD");
          }
        }
      });

      return 1; //authResult.user != null;
    } catch (e) {
      print(e.message);
      return e.message;
    }
  }

}
