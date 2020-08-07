import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_user_state.freezed.dart';

@freezed
abstract class AddUserState with _$AddUserState {
  const factory AddUserState.idle() = Idle;

  const factory AddUserState.onButtonEnabled() = ButtonEnabled;

  const factory AddUserState.onButtonDisabled() = ButtonDisabled;

  const factory AddUserState.phoneLoading() = PhoneLoading;

  const factory AddUserState.showError(String error) = ShowError;

  const factory AddUserState.registerSuccessfully() = RegisterSuccessfully;

}
