import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_product_state.freezed.dart';

@freezed
abstract class AddProductState with _$AddProductState {
  const factory AddProductState.idle() = Idle;

  const factory AddProductState.onButtonEnabled() = ButtonEnabled;

  const factory AddProductState.onButtonDisabled() = ButtonDisabled;

  const factory AddProductState.saveDataLoading() = SaveDataLoading;

  const factory AddProductState.showError(String error) = ShowError;

  const factory AddProductState.savedSuccessfully() = SavedSuccessfully;

}
