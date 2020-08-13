import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_email_state.freezed.dart';

@freezed
abstract class SendEmailState with _$SendEmailState {
  const factory SendEmailState.idle() = Idle;

  const factory SendEmailState.sendEmail() = SendEmail;

  const factory SendEmailState.orderSuccessfullyPlaced() =
      OrderSuccessfullyPlaced;

  const factory SendEmailState.orderNotPlaced(String message) = OrderNotPlaced;
}
