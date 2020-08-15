//import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercommerce/src/bloc/send_email/send_email_state.dart';
import 'package:fluttercommerce/src/repository/auth_repository.dart';
import 'package:fluttercommerce/src/repository/emailService.dart';
import 'package:html/parser.dart';
import 'package:mailer2/mailer.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttercommerce/src/core/utils/connectivity.dart';
import 'package:fluttercommerce/src/di/app_injector.dart';
import 'package:fluttercommerce/src/notifiers/account_provider.dart';
import 'package:fluttercommerce/src/notifiers/cart_status_provider.dart';
import 'package:fluttercommerce/src/repository/firestore_repository.dart';
import 'package:fluttercommerce/src/res/email_settings.dart';


class SendEmailCubit extends Cubit<SendEmailState> {
  var firebaseRepo = AppInjector.get<FirestoreRepository>();
  var accountProvider = AppInjector.get<AccountProvider>();
  var emailService = AppInjector.get<EmailService>();
  var _authRepo = AppInjector.get<AuthRepository>();

  SendEmailCubit() : super(SendEmailState.idle());

  sendEmail(CartStatusProvider cartItemStatus) async {
    if (await ConnectionStatus.getInstance().checkConnection()) {
      try {

        await _authRepo.firebaseAuth.currentUser().then((value) {
          var options = new GmailSmtpOptions()
            ..username = EmailSettings.email
            ..password = EmailSettings.password;

          var emailTransport = new SmtpTransport(options);

          var envelope = new Envelope()
            ..from = EmailSettings.email
            ..recipients.add(value.email)
            //..bccRecipients.add('hidden@recipient.com')
            ..subject = 'Innovative Hub Invoice'
            //..attachments.add(new Attachment(file: new File('path/to/file')))
            ..text = 'Innovative Hub Invoice !!'
            //..html = '<h1>Test</h1><p>Hey!</p>';
            ..html = "Total Amount : ${cartItemStatus.priceInCart}";

          // Email it.
          emailTransport
              .send(envelope)
              .then((envelope) => print('Email sent!'))
              .catchError((e) => print('Error occurred: $e'));

          print("email send after");
        });

      } catch (e) {
        print(e);
      }
    } else {
      print("else");
    }
  }
}
