import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercommerce/src/bloc/add_user/add_user_state.dart';
import 'package:fluttercommerce/src/di/app_injector.dart';
import 'package:fluttercommerce/src/repository/auth_repository.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit() : super(AddUserState.onButtonDisabled());
  AuthRepository authRepository = AppInjector.get<AuthRepository>();

  validateButton(String phoneNumber) {
    emit(AddUserState.onButtonEnabled());
  }

  registerNewUser(String email, String password) async {
    try {
      authRepository.signUpWithEmail(email, password);
      emit(AddUserState.registerSuccessfully());
    } catch (e) {
      emit(AddUserState.showError(e));
    }
  }

  checkPhoneNumber(String phoneNumber) {}
}
