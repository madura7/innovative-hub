// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'all_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AllProductStateTearOff {
  const _$AllProductStateTearOff();

  ProductLoading productLoading() {
    return const ProductLoading();
  }
}

// ignore: unused_element
const $AllProductState = _$AllProductStateTearOff();

mixin _$AllProductState {}

abstract class $AllProductStateCopyWith<$Res> {
  factory $AllProductStateCopyWith(
          AllProductState value, $Res Function(AllProductState) then) =
      _$AllProductStateCopyWithImpl<$Res>;
}

class _$AllProductStateCopyWithImpl<$Res>
    implements $AllProductStateCopyWith<$Res> {
  _$AllProductStateCopyWithImpl(this._value, this._then);

  final AllProductState _value;
  // ignore: unused_field
  final $Res Function(AllProductState) _then;
}

abstract class $ProductLoadingCopyWith<$Res> {
  factory $ProductLoadingCopyWith(
          ProductLoading value, $Res Function(ProductLoading) then) =
      _$ProductLoadingCopyWithImpl<$Res>;
}

class _$ProductLoadingCopyWithImpl<$Res>
    extends _$AllProductStateCopyWithImpl<$Res>
    implements $ProductLoadingCopyWith<$Res> {
  _$ProductLoadingCopyWithImpl(
      ProductLoading _value, $Res Function(ProductLoading) _then)
      : super(_value, (v) => _then(v as ProductLoading));

  @override
  ProductLoading get _value => super._value as ProductLoading;
}

class _$ProductLoading implements ProductLoading {
  const _$ProductLoading();

  @override
  String toString() {
    return 'AllProductState.productLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ProductLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ProductLoading implements AllProductState {
  const factory ProductLoading() = _$ProductLoading;
}
