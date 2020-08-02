// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'address_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AddressCardStateTearOff {
  const _$AddressCardStateTearOff();

  Idle idle() {
    return const Idle();
  }

  EditLoading editLoading() {
    return const EditLoading();
  }

  SetDefaultLoading setDefaultLoading() {
    return const SetDefaultLoading();
  }

  Error error(String message) {
    return Error(
      message,
    );
  }

  Successful successful() {
    return const Successful();
  }
}

// ignore: unused_element
const $AddressCardState = _$AddressCardStateTearOff();

mixin _$AddressCardState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result editLoading(),
    @required Result setDefaultLoading(),
    @required Result error(String message),
    @required Result successful(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result editLoading(),
    Result setDefaultLoading(),
    Result error(String message),
    Result successful(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result editLoading(EditLoading value),
    @required Result setDefaultLoading(SetDefaultLoading value),
    @required Result error(Error value),
    @required Result successful(Successful value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result editLoading(EditLoading value),
    Result setDefaultLoading(SetDefaultLoading value),
    Result error(Error value),
    Result successful(Successful value),
    @required Result orElse(),
  });
}

abstract class $AddressCardStateCopyWith<$Res> {
  factory $AddressCardStateCopyWith(
          AddressCardState value, $Res Function(AddressCardState) then) =
      _$AddressCardStateCopyWithImpl<$Res>;
}

class _$AddressCardStateCopyWithImpl<$Res>
    implements $AddressCardStateCopyWith<$Res> {
  _$AddressCardStateCopyWithImpl(this._value, this._then);

  final AddressCardState _value;
  // ignore: unused_field
  final $Res Function(AddressCardState) _then;
}

abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

class _$IdleCopyWithImpl<$Res> extends _$AddressCardStateCopyWithImpl<$Res>
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
    return 'AddressCardState.idle()';
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
    @required Result editLoading(),
    @required Result setDefaultLoading(),
    @required Result error(String message),
    @required Result successful(),
  }) {
    assert(idle != null);
    assert(editLoading != null);
    assert(setDefaultLoading != null);
    assert(error != null);
    assert(successful != null);
    return idle();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result editLoading(),
    Result setDefaultLoading(),
    Result error(String message),
    Result successful(),
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
    @required Result editLoading(EditLoading value),
    @required Result setDefaultLoading(SetDefaultLoading value),
    @required Result error(Error value),
    @required Result successful(Successful value),
  }) {
    assert(idle != null);
    assert(editLoading != null);
    assert(setDefaultLoading != null);
    assert(error != null);
    assert(successful != null);
    return idle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result editLoading(EditLoading value),
    Result setDefaultLoading(SetDefaultLoading value),
    Result error(Error value),
    Result successful(Successful value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements AddressCardState {
  const factory Idle() = _$Idle;
}

abstract class $EditLoadingCopyWith<$Res> {
  factory $EditLoadingCopyWith(
          EditLoading value, $Res Function(EditLoading) then) =
      _$EditLoadingCopyWithImpl<$Res>;
}

class _$EditLoadingCopyWithImpl<$Res>
    extends _$AddressCardStateCopyWithImpl<$Res>
    implements $EditLoadingCopyWith<$Res> {
  _$EditLoadingCopyWithImpl(
      EditLoading _value, $Res Function(EditLoading) _then)
      : super(_value, (v) => _then(v as EditLoading));

  @override
  EditLoading get _value => super._value as EditLoading;
}

class _$EditLoading implements EditLoading {
  const _$EditLoading();

  @override
  String toString() {
    return 'AddressCardState.editLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EditLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result editLoading(),
    @required Result setDefaultLoading(),
    @required Result error(String message),
    @required Result successful(),
  }) {
    assert(idle != null);
    assert(editLoading != null);
    assert(setDefaultLoading != null);
    assert(error != null);
    assert(successful != null);
    return editLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result editLoading(),
    Result setDefaultLoading(),
    Result error(String message),
    Result successful(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editLoading != null) {
      return editLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result editLoading(EditLoading value),
    @required Result setDefaultLoading(SetDefaultLoading value),
    @required Result error(Error value),
    @required Result successful(Successful value),
  }) {
    assert(idle != null);
    assert(editLoading != null);
    assert(setDefaultLoading != null);
    assert(error != null);
    assert(successful != null);
    return editLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result editLoading(EditLoading value),
    Result setDefaultLoading(SetDefaultLoading value),
    Result error(Error value),
    Result successful(Successful value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editLoading != null) {
      return editLoading(this);
    }
    return orElse();
  }
}

abstract class EditLoading implements AddressCardState {
  const factory EditLoading() = _$EditLoading;
}

abstract class $SetDefaultLoadingCopyWith<$Res> {
  factory $SetDefaultLoadingCopyWith(
          SetDefaultLoading value, $Res Function(SetDefaultLoading) then) =
      _$SetDefaultLoadingCopyWithImpl<$Res>;
}

class _$SetDefaultLoadingCopyWithImpl<$Res>
    extends _$AddressCardStateCopyWithImpl<$Res>
    implements $SetDefaultLoadingCopyWith<$Res> {
  _$SetDefaultLoadingCopyWithImpl(
      SetDefaultLoading _value, $Res Function(SetDefaultLoading) _then)
      : super(_value, (v) => _then(v as SetDefaultLoading));

  @override
  SetDefaultLoading get _value => super._value as SetDefaultLoading;
}

class _$SetDefaultLoading implements SetDefaultLoading {
  const _$SetDefaultLoading();

  @override
  String toString() {
    return 'AddressCardState.setDefaultLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SetDefaultLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result editLoading(),
    @required Result setDefaultLoading(),
    @required Result error(String message),
    @required Result successful(),
  }) {
    assert(idle != null);
    assert(editLoading != null);
    assert(setDefaultLoading != null);
    assert(error != null);
    assert(successful != null);
    return setDefaultLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result editLoading(),
    Result setDefaultLoading(),
    Result error(String message),
    Result successful(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setDefaultLoading != null) {
      return setDefaultLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result editLoading(EditLoading value),
    @required Result setDefaultLoading(SetDefaultLoading value),
    @required Result error(Error value),
    @required Result successful(Successful value),
  }) {
    assert(idle != null);
    assert(editLoading != null);
    assert(setDefaultLoading != null);
    assert(error != null);
    assert(successful != null);
    return setDefaultLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result editLoading(EditLoading value),
    Result setDefaultLoading(SetDefaultLoading value),
    Result error(Error value),
    Result successful(Successful value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setDefaultLoading != null) {
      return setDefaultLoading(this);
    }
    return orElse();
  }
}

abstract class SetDefaultLoading implements AddressCardState {
  const factory SetDefaultLoading() = _$SetDefaultLoading;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$ErrorCopyWithImpl<$Res> extends _$AddressCardStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(Error(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$Error implements Error {
  const _$Error(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'AddressCardState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result editLoading(),
    @required Result setDefaultLoading(),
    @required Result error(String message),
    @required Result successful(),
  }) {
    assert(idle != null);
    assert(editLoading != null);
    assert(setDefaultLoading != null);
    assert(error != null);
    assert(successful != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result editLoading(),
    Result setDefaultLoading(),
    Result error(String message),
    Result successful(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result editLoading(EditLoading value),
    @required Result setDefaultLoading(SetDefaultLoading value),
    @required Result error(Error value),
    @required Result successful(Successful value),
  }) {
    assert(idle != null);
    assert(editLoading != null);
    assert(setDefaultLoading != null);
    assert(error != null);
    assert(successful != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result editLoading(EditLoading value),
    Result setDefaultLoading(SetDefaultLoading value),
    Result error(Error value),
    Result successful(Successful value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AddressCardState {
  const factory Error(String message) = _$Error;

  String get message;
  $ErrorCopyWith<Error> get copyWith;
}

abstract class $SuccessfulCopyWith<$Res> {
  factory $SuccessfulCopyWith(
          Successful value, $Res Function(Successful) then) =
      _$SuccessfulCopyWithImpl<$Res>;
}

class _$SuccessfulCopyWithImpl<$Res>
    extends _$AddressCardStateCopyWithImpl<$Res>
    implements $SuccessfulCopyWith<$Res> {
  _$SuccessfulCopyWithImpl(Successful _value, $Res Function(Successful) _then)
      : super(_value, (v) => _then(v as Successful));

  @override
  Successful get _value => super._value as Successful;
}

class _$Successful implements Successful {
  const _$Successful();

  @override
  String toString() {
    return 'AddressCardState.successful()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Successful);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result editLoading(),
    @required Result setDefaultLoading(),
    @required Result error(String message),
    @required Result successful(),
  }) {
    assert(idle != null);
    assert(editLoading != null);
    assert(setDefaultLoading != null);
    assert(error != null);
    assert(successful != null);
    return successful();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result editLoading(),
    Result setDefaultLoading(),
    Result error(String message),
    Result successful(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (successful != null) {
      return successful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result editLoading(EditLoading value),
    @required Result setDefaultLoading(SetDefaultLoading value),
    @required Result error(Error value),
    @required Result successful(Successful value),
  }) {
    assert(idle != null);
    assert(editLoading != null);
    assert(setDefaultLoading != null);
    assert(error != null);
    assert(successful != null);
    return successful(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result editLoading(EditLoading value),
    Result setDefaultLoading(SetDefaultLoading value),
    Result error(Error value),
    Result successful(Successful value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class Successful implements AddressCardState {
  const factory Successful() = _$Successful;
}
