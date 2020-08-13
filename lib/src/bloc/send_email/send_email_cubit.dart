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

class SendEmailCubit extends Cubit<SendEmailState> {
  var firebaseRepo = AppInjector.get<FirestoreRepository>();
  var accountProvider = AppInjector.get<AccountProvider>();
  var emailService = AppInjector.get<EmailService>();
  var _authRepo = AppInjector.get<AuthRepository>();

  SendEmailCubit() : super(SendEmailState.idle());

  sendEmail(CartStatusProvider cartItemStatus) async {
    if (await ConnectionStatus.getInstance().checkConnection()) {
      try {
        print("email send before");
        // await emailService.send("email", "cartItemStatus.", "subject",
        //     "madura12a@gmail.com", "attachmentPaths", false);

        var _count = cartItemStatus.cartItems.length;


        var document = parse(
            '<body>Hello world! <a href="www.html5rocks.com">HTML5 rocks!');
        print(document.outerHtml);

        await _authRepo.firebaseAuth.currentUser().then((value) {
          var options = new GmailSmtpOptions()
            ..username = 'dev.codemax@gmail.com'
            ..password = 'CodeMax@9517';

          var emailTransport = new SmtpTransport(options);

          var envelope = new Envelope()
            ..from = 'dev.codemax@gmail.com'
            ..recipients.add(value.email)
            //..bccRecipients.add('hidden@recipient.com')
            ..subject = 'Innovative Hub Invoice'
            //..attachments.add(new Attachment(file: new File('path/to/file')))
            ..text = 'Innovative Hub Invoice T'
            //..html = '<h1>Test</h1><p>Hey!</p>';
            ..html = 'System Generated Email';

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
