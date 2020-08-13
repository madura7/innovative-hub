import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttercommerce/src/di/app_injector.dart';
import 'package:fluttercommerce/src/notifiers/account_provider.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';


class EmailService {
  var firebaseAuth = FirebaseAuth.instance;
  var accountProvider = AppInjector.get<AccountProvider>();
  final databaseReference = Firestore.instance;

    Future<void> send(
      String email, String body, String subject, 
      String recipients, String attachmentPaths, bool isHTML) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [recipients],
      //attachmentPaths: attachmentPaths,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    //if (!mounted) return;

    return platformResponse;
  }

}
