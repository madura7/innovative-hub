// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'send_email_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SendEmailStateTearOff {
  const _$SendEmailStateTearOff();

  Idle idle() {
    return const Idle();
  }

  SendEmail sendEmail() {
    return const SendEmail();
  }

  OrderSuccessfullyPlaced orderSuccessfullyPlaced() {
    return const OrderSuccessfullyPlaced();
  }

  OrderNotPlaced orderNotPlaced(String message) {
    return OrderNotPlaced(
      message,
    );
  }
}

// ignore: unused_element
const $SendEmailState = _$SendEmailStateTearOff();

mixin _$SendEmailState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result sendEmail(),
    @required Result orderSuccessfullyPlaced(),
    @required Result orderNotPlaced(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result sendEmail(),
    Result orderSuccessfullyPlaced(),
    Result orderNotPlaced(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result sendEmail(SendEmail value),
    @required Result orderSuccessfullyPlaced(OrderSuccessfullyPlaced value),
    @required Result orderNotPlaced(OrderNotPlaced value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result sendEmail(SendEmail value),
    Result orderSuccessfullyPlaced(OrderSuccessfullyPlaced value),
    Result orderNotPlaced(OrderNotPlaced value),
    @required Result orElse(),
  });
}

abstract class $SendEmailStateCopyWith<$Res> {
  factory $SendEmailStateCopyWith(
          SendEmailState value, $Res Function(SendEmailState) then) =
      _$SendEmailStateCopyWithImpl<$Res>;
}

class _$SendEmailStateCopyWithImpl<$Res>
    implements $SendEmailStateCopyWith<$Res> {
  _$SendEmailStateCopyWithImpl(this._value, this._then);

  final SendEmailState _value;
  // ignore: unused_field
  final $Res Function(SendEmailState) _then;
}

abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

class _$IdleCopyWithImpl<$Res> extends _$SendEmailStateCopyWithImpl<$Res>
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
    return 'SendEmailState.idle()';
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
    @required Result sendEmail(),
    @required Result orderSuccessfullyPlaced(),
    @required Result orderNotPlaced(String message),
  }) {
    assert(idle != null);
    assert(sendEmail != null);
    assert(orderSuccessfullyPlaced != null);
    assert(orderNotPlaced != null);
    return idle();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result sendEmail(),
    Result orderSuccessfullyPlaced(),
    Result orderNotPlaced(String message),
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
    @required Result sendEmail(SendEmail value),
    @required Result orderSuccessfullyPlaced(OrderSuccessfullyPlaced value),
    @required Result orderNotPlaced(OrderNotPlaced value),
  }) {
    assert(idle != null);
    assert(sendEmail != null);
    assert(orderSuccessfullyPlaced != null);
    assert(orderNotPlaced != null);
    return idle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result sendEmail(SendEmail value),
    Result orderSuccessfullyPlaced(OrderSuccessfullyPlaced value),
    Result orderNotPlaced(OrderNotPlaced value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements SendEmailState {
  const factory Idle() = _$Idle;
}

abstract class $SendEmailCopyWith<$Res> {
  factory $SendEmailCopyWith(SendEmail value, $Res Function(SendEmail) then) =
      _$SendEmailCopyWithImpl<$Res>;
}

class _$SendEmailCopyWithImpl<$Res> extends _$SendEmailStateCopyWithImpl<$Res>
    implements $SendEmailCopyWith<$Res> {
  _$SendEmailCopyWithImpl(SendEmail _value, $Res Function(SendEmail) _then)
      : super(_value, (v) => _then(v as SendEmail));

  @override
  SendEmail get _value => super._value as SendEmail;
}

class _$SendEmail implements SendEmail {
  const _$SendEmail();

  @override
  String toString() {
    return 'SendEmailState.sendEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SendEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result sendEmail(),
    @required Result orderSuccessfullyPlaced(),
    @required Result orderNotPlaced(String message),
  }) {
    assert(idle != null);
    assert(sendEmail != null);
    assert(orderSuccessfullyPlaced != null);
    assert(orderNotPlaced != null);
    return sendEmail();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result sendEmail(),
    Result orderSuccessfullyPlaced(),
    Result orderNotPlaced(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendEmail != null) {
      return sendEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result sendEmail(SendEmail value),
    @required Result orderSuccessfullyPlaced(OrderSuccessfullyPlaced value),
    @required Result orderNotPlaced(OrderNotPlaced value),
  }) {
    assert(idle != null);
    assert(sendEmail != null);
    assert(orderSuccessfullyPlaced != null);
    assert(orderNotPlaced != null);
    return sendEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result sendEmail(SendEmail value),
    Result orderSuccessfullyPlaced(OrderSuccessfullyPlaced value),
    Result orderNotPlaced(OrderNotPlaced value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendEmail != null) {
      return sendEmail(this);
    }
    return orElse();
  }
}

abstract class SendEmail implements SendEmailState {
  const factory SendEmail() = _$SendEmail;
}

abstract class $OrderSuccessfullyPlacedCopyWith<$Res> {
  factory $OrderSuccessfullyPlacedCopyWith(OrderSuccessfullyPlaced value,
          $Res Function(OrderSuccessfullyPlaced) then) =
      _$OrderSuccessfullyPlacedCopyWithImpl<$Res>;
}

class _$OrderSuccessfullyPlacedCopyWithImpl<$Res>
    extends _$SendEmailStateCopyWithImpl<$Res>
    implements $OrderSuccessfullyPlacedCopyWith<$Res> {
  _$OrderSuccessfullyPlacedCopyWithImpl(OrderSuccessfullyPlaced _value,
      $Res Function(OrderSuccessfullyPlaced) _then)
      : super(_value, (v) => _then(v as OrderSuccessfullyPlaced));

  @override
  OrderSuccessfullyPlaced get _value => super._value as OrderSuccessfullyPlaced;
}

class _$OrderSuccessfullyPlaced implements OrderSuccessfullyPlaced {
  const _$OrderSuccessfullyPlaced();

  @override
  String toString() {
    return 'SendEmailState.orderSuccessfullyPlaced()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is OrderSuccessfullyPlaced);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result sendEmail(),
    @required Result orderSuccessfullyPlaced(),
    @required Result orderNotPlaced(String message),
  }) {
    assert(idle != null);
    assert(sendEmail != null);
    assert(orderSuccessfullyPlaced != null);
    assert(orderNotPlaced != null);
    return orderSuccessfullyPlaced();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result sendEmail(),
    Result orderSuccessfullyPlaced(),
    Result orderNotPlaced(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (orderSuccessfullyPlaced != null) {
      return orderSuccessfullyPlaced();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result sendEmail(SendEmail value),
    @required Result orderSuccessfullyPlaced(OrderSuccessfullyPlaced value),
    @required Result orderNotPlaced(OrderNotPlaced value),
  }) {
    assert(idle != null);
    assert(sendEmail != null);
    assert(orderSuccessfullyPlaced != null);
    assert(orderNotPlaced != null);
    return orderSuccessfullyPlaced(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result sendEmail(SendEmail value),
    Result orderSuccessfullyPlaced(OrderSuccessfullyPlaced value),
    Result orderNotPlaced(OrderNotPlaced value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (orderSuccessfullyPlaced != null) {
      return orderSuccessfullyPlaced(this);
    }
    return orElse();
  }
}

abstract class OrderSuccessfullyPlaced implements SendEmailState {
  const factory OrderSuccessfullyPlaced() = _$OrderSuccessfullyPlaced;
}

abstract class $OrderNotPlacedCopyWith<$Res> {
  factory $OrderNotPlacedCopyWith(
          OrderNotPlaced value, $Res Function(OrderNotPlaced) then) =
      _$OrderNotPlacedCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$OrderNotPlacedCopyWithImpl<$Res>
    extends _$SendEmailStateCopyWithImpl<$Res>
    implements $OrderNotPlacedCopyWith<$Res> {
  _$OrderNotPlacedCopyWithImpl(
      OrderNotPlaced _value, $Res Function(OrderNotPlaced) _then)
      : super(_value, (v) => _then(v as OrderNotPlaced));

  @override
  OrderNotPlaced get _value => super._value as OrderNotPlaced;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(OrderNotPlaced(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$OrderNotPlaced implements OrderNotPlaced {
  const _$OrderNotPlaced(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'SendEmailState.orderNotPlaced(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OrderNotPlaced &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $OrderNotPlacedCopyWith<OrderNotPlaced> get copyWith =>
      _$OrderNotPlacedCopyWithImpl<OrderNotPlaced>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result sendEmail(),
    @required Result orderSuccessfullyPlaced(),
    @required Result orderNotPlaced(String message),
  }) {
    assert(idle != null);
    assert(sendEmail != null);
    assert(orderSuccessfullyPlaced != null);
    assert(orderNotPlaced != null);
    return orderNotPlaced(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result sendEmail(),
    Result orderSuccessfullyPlaced(),
    Result orderNotPlaced(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (orderNotPlaced != null) {
      return orderNotPlaced(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(Idle value),
    @required Result sendEmail(SendEmail value),
    @required Result orderSuccessfullyPlaced(OrderSuccessfullyPlaced value),
    @required Result orderNotPlaced(OrderNotPlaced value),
  }) {
    assert(idle != null);
    assert(sendEmail != null);
    assert(orderSuccessfullyPlaced != null);
    assert(orderNotPlaced != null);
    return orderNotPlaced(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(Idle value),
    Result sendEmail(SendEmail value),
    Result orderSuccessfullyPlaced(OrderSuccessfullyPlaced value),
    Result orderNotPlaced(OrderNotPlaced value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (orderNotPlaced != null) {
      return orderNotPlaced(this);
    }
    return orElse();
  }
}

abstract class OrderNotPlaced implements SendEmailState {
  const factory OrderNotPlaced(String message) = _$OrderNotPlaced;

  String get message;
  $OrderNotPlacedCopyWith<OrderNotPlaced> get copyWith;
}
