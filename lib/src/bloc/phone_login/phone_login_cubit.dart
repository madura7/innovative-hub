import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercommerce/src/bloc/phone_login/phone_login_state.dart';
import 'package:fluttercommerce/src/di/app_injector.dart';
import 'package:fluttercommerce/src/repository/auth_repository.dart';

class PhoneLoginCubit extends Cubit<PhoneLoginState> {
  PhoneLoginCubit() : super(PhoneLoginState.onButtonDisabled());
  AuthRepository authRepository = AppInjector.get<AuthRepository>();

  validateButton(String email) {
    if (email.isNotEmpty) {
      emit(PhoneLoginState.onButtonEnabled());
    } else {
      emit(PhoneLoginState.onButtonDisabled());
    }
  }

  loginWithEmail(String email, String password) {
    try {      
      emit(PhoneLoginState.phoneLoading());
      var _credential = EmailAuthProvider.getCredential(email: email, password: password);
      print("getCredential");
      _login(_credential);
    } catch (e) {
      emit(PhoneLoginState.showError(e));
    }
  }
  
  _login(AuthCredential authCred) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      firebaseAuth.signInWithCredential(authCred)
        .then((value) => emit(PhoneLoginState.loginSuccessFull())).catchError((onError) {
        if (onError is PlatformException) {
          if (onError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
            print("ERROR_INVALID_EMAIL");
          }
          else if (onError.code == 'ERROR_INVALID_EMAIL') {
            print("ERROR_INVALID_EMAIL");
          }
          else if (onError.code == 'ERROR_WEAK_PASSWORD') {
            print("ERROR_WEAK_PASSWORD");
          }
           else if (onError.code == 'ERROR_WRONG_PASSWORD') {
            emit(PhoneLoginState.showError("ERROR_WRONG_PASSWORD"));
          }else{
            emit(PhoneLoginState.showError(onError.code));
          }
        }
      });
        
    }catch(e){

    }
  }

  checkPhoneNumber(String phoneNumber) {}
}
