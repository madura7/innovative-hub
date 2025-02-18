// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'phone_login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PhoneLoginStateTearOff {
  const _$PhoneLoginStateTearOff();

  Idle idle() {
    return const Idle();
  }

  ButtonEnabled onButtonEnabled() {
    return const ButtonEnabled();
  }

  ButtonDisabled onButtonDisabled() {
    return const ButtonDisabled();
  }

  PhoneLoading phoneLoading() {
    return const PhoneLoading();
  }

  ShowError showError(String error) {
    return ShowError(
      error,
    );
  }

  LoginSuccessFull loginSuccessFull() {
    return const LoginSuccessFull();
  }
}

// ignore: unused_element
const $PhoneLoginState = _$PhoneLoginStateTearOff();

mixin _$PhoneLoginState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result onButtonEnabled(),
    @required Result onButtonDisabled(),
    @required Result phoneLoading(),
    @required Result showError(String error),
    @required Result loginSuccessFull(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result onButtonEnabled(),
    Result onButtonDisabled(),
    Result phoneLoading(),
    Result showError(String error),
    Result loginSuccessFull(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result onButtonEnabled(ButtonEnabled value),
    @required Result onButtonDisabled(ButtonDisabled value),
    @required Result phoneLoading(PhoneLoading value),
    @required Result showError(ShowError value),
    @required Result loginSuccessFull(LoginSuccessFull value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result onButtonEnabled(ButtonEnabled value),
    Result onButtonDisabled(ButtonDisabled value),
    Result phoneLoading(PhoneLoading value),
    Result showError(ShowError value),
    Result loginSuccessFull(LoginSuccessFull value),
    @required Result orElse(),
  });
}

abstract class $PhoneLoginStateCopyWith<$Res> {
  factory $PhoneLoginStateCopyWith(
          PhoneLoginState value, $Res Function(PhoneLoginState) then) =
      _$PhoneLoginStateCopyWithImpl<$Res>;
}

class _$PhoneLoginStateCopyWithImpl<$Res>
    implements $PhoneLoginStateCopyWith<$Res> {
  _$PhoneLoginStateCopyWithImpl(this._value, this._then);

  final PhoneLoginState _value;
  // ignore: unused_field
  final $Res Function(PhoneLoginState) _then;
}

abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

class _$IdleCopyWithImpl<$Res> extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements $IdleCopyWith<$Res> {
  _$IdleCopyWithImpl(Idle _value, $Res Function(Idle) _then)
      : super(_value, (v) => _then(v as Idle));

  @override
  Idle get _value => super._value as Idle;
}

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'PhoneLoginState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result onButtonEnabled(),
    @required Result onButtonDisabled(),
    @required Result phoneLoading(),
    @required Result showError(String error),
    @required Result loginSuccessFull(),
  }) {
    assert(idle != null);
    assert(onButtonEnabled != null);
    assert(onButtonDisabled != null);
    assert(phoneLoading != null);
    assert(showError != null);
    assert(loginSuccessFull != null);
    return idle();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result onButtonEnabled(),
    Result onButtonDisabled(),
    Result phoneLoading(),
    Result showError(String error),
    Result loginSuccessFull(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result onButtonEnabled(ButtonEnabled value),
    @required Result onButtonDisabled(ButtonDisabled value),
    @required Result phoneLoading(PhoneLoading value),
    @required Result showError(ShowError value),
    @required Result loginSuccessFull(LoginSuccessFull value),
  }) {
    assert(idle != null);
    assert(onButtonEnabled != null);
    assert(onButtonDisabled != null);
    assert(phoneLoading != null);
    assert(showError != null);
    assert(loginSuccessFull != null);
    return idle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result onButtonEnabled(ButtonEnabled value),
    Result onButtonDisabled(ButtonDisabled value),
    Result phoneLoading(PhoneLoading value),
    Result showError(ShowError value),
    Result loginSuccessFull(LoginSuccessFull value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements PhoneLoginState {
  const factory Idle() = _$Idle;
}

abstract class $ButtonEnabledCopyWith<$Res> {
  factory $ButtonEnabledCopyWith(
          ButtonEnabled value, $Res Function(ButtonEnabled) then) =
      _$ButtonEnabledCopyWithImpl<$Res>;
}

class _$ButtonEnabledCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements $ButtonEnabledCopyWith<$Res> {
  _$ButtonEnabledCopyWithImpl(
      ButtonEnabled _value, $Res Function(ButtonEnabled) _then)
      : super(_value, (v) => _then(v as ButtonEnabled));

  @override
  ButtonEnabled get _value => super._value as ButtonEnabled;
}

class _$ButtonEnabled implements ButtonEnabled {
  const _$ButtonEnabled();

  @override
  String toString() {
    return 'PhoneLoginState.onButtonEnabled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ButtonEnabled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result onButtonEnabled(),
    @required Result onButtonDisabled(),
    @required Result phoneLoading(),
    @required Result showError(String error),
    @required Result loginSuccessFull(),
  }) {
    assert(idle != null);
    assert(onButtonEnabled != null);
    assert(onButtonDisabled != null);
    assert(phoneLoading != null);
    assert(showError != null);
    assert(loginSuccessFull != null);
    return onButtonEnabled();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result onButtonEnabled(),
    Result onButtonDisabled(),
    Result phoneLoading(),
    Result showError(String error),
    Result loginSuccessFull(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onButtonEnabled != null) {
      return onButtonEnabled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result onButtonEnabled(ButtonEnabled value),
    @required Result onButtonDisabled(ButtonDisabled value),
    @required Result phoneLoading(PhoneLoading value),
    @required Result showError(ShowError value),
    @required Result loginSuccessFull(LoginSuccessFull value),
  }) {
    assert(idle != null);
    assert(onButtonEnabled != null);
    assert(onButtonDisabled != null);
    assert(phoneLoading != null);
    assert(showError != null);
    assert(loginSuccessFull != null);
    return onButtonEnabled(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result onButtonEnabled(ButtonEnabled value),
    Result onButtonDisabled(ButtonDisabled value),
    Result phoneLoading(PhoneLoading value),
    Result showError(ShowError value),
    Result loginSuccessFull(LoginSuccessFull value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onButtonEnabled != null) {
      return onButtonEnabled(this);
    }
    return orElse();
  }
}

abstract class ButtonEnabled implements PhoneLoginState {
  const factory ButtonEnabled() = _$ButtonEnabled;
}

abstract class $ButtonDisabledCopyWith<$Res> {
  factory $ButtonDisabledCopyWith(
          ButtonDisabled value, $Res Function(ButtonDisabled) then) =
      _$ButtonDisabledCopyWithImpl<$Res>;
}

class _$ButtonDisabledCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements $ButtonDisabledCopyWith<$Res> {
  _$ButtonDisabledCopyWithImpl(
      ButtonDisabled _value, $Res Function(ButtonDisabled) _then)
      : super(_value, (v) => _then(v as ButtonDisabled));

  @override
  ButtonDisabled get _value => super._value as ButtonDisabled;
}

class _$ButtonDisabled implements ButtonDisabled {
  const _$ButtonDisabled();

  @override
  String toString() {
    return 'PhoneLoginState.onButtonDisabled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ButtonDisabled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result onButtonEnabled(),
    @required Result onButtonDisabled(),
    @required Result phoneLoading(),
    @required Result showError(String error),
    @required Result loginSuccessFull(),
  }) {
    assert(idle != null);
    assert(onButtonEnabled != null);
    assert(onButtonDisabled != null);
    assert(phoneLoading != null);
    assert(showError != null);
    assert(loginSuccessFull != null);
    return onButtonDisabled();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result onButtonEnabled(),
    Result onButtonDisabled(),
    Result phoneLoading(),
    Result showError(String error),
    Result loginSuccessFull(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onButtonDisabled != null) {
      return onButtonDisabled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result onButtonEnabled(ButtonEnabled value),
    @required Result onButtonDisabled(ButtonDisabled value),
    @required Result phoneLoading(PhoneLoading value),
    @required Result showError(ShowError value),
    @required Result loginSuccessFull(LoginSuccessFull value),
  }) {
    assert(idle != null);
    assert(onButtonEnabled != null);
    assert(onButtonDisabled != null);
    assert(phoneLoading != null);
    assert(showError != null);
    assert(loginSuccessFull != null);
    return onButtonDisabled(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result onButtonEnabled(ButtonEnabled value),
    Result onButtonDisabled(ButtonDisabled value),
    Result phoneLoading(PhoneLoading value),
    Result showError(ShowError value),
    Result loginSuccessFull(LoginSuccessFull value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onButtonDisabled != null) {
      return onButtonDisabled(this);
    }
    return orElse();
  }
}

abstract class ButtonDisabled implements PhoneLoginState {
  const factory ButtonDisabled() = _$ButtonDisabled;
}

abstract class $PhoneLoadingCopyWith<$Res> {
  factory $PhoneLoadingCopyWith(
          PhoneLoading value, $Res Function(PhoneLoading) then) =
      _$PhoneLoadingCopyWithImpl<$Res>;
}

class _$PhoneLoadingCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements $PhoneLoadingCopyWith<$Res> {
  _$PhoneLoadingCopyWithImpl(
      PhoneLoading _value, $Res Function(PhoneLoading) _then)
      : super(_value, (v) => _then(v as PhoneLoading));

  @override
  PhoneLoading get _value => super._value as PhoneLoading;
}

class _$PhoneLoading implements PhoneLoading {
  const _$PhoneLoading();

  @override
  String toString() {
    return 'PhoneLoginState.phoneLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PhoneLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result onButtonEnabled(),
    @required Result onButtonDisabled(),
    @required Result phoneLoading(),
    @required Result showError(String error),
    @required Result loginSuccessFull(),
  }) {
    assert(idle != null);
    assert(onButtonEnabled != null);
    assert(onButtonDisabled != null);
    assert(phoneLoading != null);
    assert(showError != null);
    assert(loginSuccessFull != null);
    return phoneLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result onButtonEnabled(),
    Result onButtonDisabled(),
    Result phoneLoading(),
    Result showError(String error),
    Result loginSuccessFull(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (phoneLoading != null) {
      return phoneLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result onButtonEnabled(ButtonEnabled value),
    @required Result onButtonDisabled(ButtonDisabled value),
    @required Result phoneLoading(PhoneLoading value),
    @required Result showError(ShowError value),
    @required Result loginSuccessFull(LoginSuccessFull value),
  }) {
    assert(idle != null);
    assert(onButtonEnabled != null);
    assert(onButtonDisabled != null);
    assert(phoneLoading != null);
    assert(showError != null);
    assert(loginSuccessFull != null);
    return phoneLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result onButtonEnabled(ButtonEnabled value),
    Result onButtonDisabled(ButtonDisabled value),
    Result phoneLoading(PhoneLoading value),
    Result showError(ShowError value),
    Result loginSuccessFull(LoginSuccessFull value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (phoneLoading != null) {
      return phoneLoading(this);
    }
    return orElse();
  }
}

abstract class PhoneLoading implements PhoneLoginState {
  const factory PhoneLoading() = _$PhoneLoading;
}

abstract class $ShowErrorCopyWith<$Res> {
  factory $ShowErrorCopyWith(ShowError value, $Res Function(ShowError) then) =
      _$ShowErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

class _$ShowErrorCopyWithImpl<$Res> extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements $ShowErrorCopyWith<$Res> {
  _$ShowErrorCopyWithImpl(ShowError _value, $Res Function(ShowError) _then)
      : super(_value, (v) => _then(v as ShowError));

  @override
  ShowError get _value => super._value as ShowError;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(ShowError(
      error == freezed ? _value.error : error as String,
    ));
  }
}

class _$ShowError implements ShowError {
  const _$ShowError(this.error) : assert(error != null);

  @override
  final String error;

  @override
  String toString() {
    return 'PhoneLoginState.showError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $ShowErrorCopyWith<ShowError> get copyWith =>
      _$ShowErrorCopyWithImpl<ShowError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result onButtonEnabled(),
    @required Result onButtonDisabled(),
    @required Result phoneLoading(),
    @required Result showError(String error),
    @required Result loginSuccessFull(),
  }) {
    assert(idle != null);
    assert(onButtonEnabled != null);
    assert(onButtonDisabled != null);
    assert(phoneLoading != null);
    assert(showError != null);
    assert(loginSuccessFull != null);
    return showError(error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result onButtonEnabled(),
    Result onButtonDisabled(),
    Result phoneLoading(),
    Result showError(String error),
    Result loginSuccessFull(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showError != null) {
      return showError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result onButtonEnabled(ButtonEnabled value),
    @required Result onButtonDisabled(ButtonDisabled value),
    @required Result phoneLoading(PhoneLoading value),
    @required Result showError(ShowError value),
    @required Result loginSuccessFull(LoginSuccessFull value),
  }) {
    assert(idle != null);
    assert(onButtonEnabled != null);
    assert(onButtonDisabled != null);
    assert(phoneLoading != null);
    assert(showError != null);
    assert(loginSuccessFull != null);
    return showError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result onButtonEnabled(ButtonEnabled value),
    Result onButtonDisabled(ButtonDisabled value),
    Result phoneLoading(PhoneLoading value),
    Result showError(ShowError value),
    Result loginSuccessFull(LoginSuccessFull value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showError != null) {
      return showError(this);
    }
    return orElse();
  }
}

abstract class ShowError implements PhoneLoginState {
  const factory ShowError(String error) = _$ShowError;

  String get error;
  $ShowErrorCopyWith<ShowError> get copyWith;
}

abstract class $LoginSuccessFullCopyWith<$Res> {
  factory $LoginSuccessFullCopyWith(
          LoginSuccessFull value, $Res Function(LoginSuccessFull) then) =
      _$LoginSuccessFullCopyWithImpl<$Res>;
}

class _$LoginSuccessFullCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements $LoginSuccessFullCopyWith<$Res> {
  _$LoginSuccessFullCopyWithImpl(
      LoginSuccessFull _value, $Res Function(LoginSuccessFull) _then)
      : super(_value, (v) => _then(v as LoginSuccessFull));

  @override
  LoginSuccessFull get _value => super._value as LoginSuccessFull;
}

class _$LoginSuccessFull implements LoginSuccessFull {
  const _$LoginSuccessFull();

  @override
  String toString() {
    return 'PhoneLoginState.loginSuccessFull()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoginSuccessFull);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result onButtonEnabled(),
    @required Result onButtonDisabled(),
    @required Result phoneLoading(),
    @required Result showError(String error),
    @required Result loginSuccessFull(),
  }) {
    assert(idle != null);
    assert(onButtonEnabled != null);
    assert(onButtonDisabled != null);
    assert(phoneLoading != null);
    assert(showError != null);
    assert(loginSuccessFull != null);
    return loginSuccessFull();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result onButtonEnabled(),
    Result onButtonDisabled(),
    Result phoneLoading(),
    Result showError(String error),
    Result loginSuccessFull(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginSuccessFull != null) {
      return loginSuccessFull();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result onButtonEnabled(ButtonEnabled value),
    @required Result onButtonDisabled(ButtonDisabled value),
    @required Result phoneLoading(PhoneLoading value),
    @required Result showError(ShowError value),
    @required Result loginSuccessFull(LoginSuccessFull value),
  }) {
    assert(idle != null);
    assert(onButtonEnabled != null);
    assert(onButtonDisabled != null);
    assert(phoneLoading != null);
    assert(showError != null);
    assert(loginSuccessFull != null);
    return loginSuccessFull(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result onButtonEnabled(ButtonEnabled value),
    Result onButtonDisabled(ButtonDisabled value),
    Result phoneLoading(PhoneLoading value),
    Result showError(ShowError value),
    Result loginSuccessFull(LoginSuccessFull value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginSuccessFull != null) {
      return loginSuccessFull(this);
    }
    return orElse();
  }
}

abstract class LoginSuccessFull implements PhoneLoginState {
  const factory LoginSuccessFull() = _$LoginSuccessFull;
}
