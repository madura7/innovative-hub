import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercommerce/src/bloc/add_product/add_product_state.dart';
import 'package:fluttercommerce/src/di/app_injector.dart';
import 'package:fluttercommerce/src/models/product_model.dart';
import 'package:fluttercommerce/src/repository/auth_repository.dart';
import 'package:fluttercommerce/src/repository/firestore_repository.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductState.onButtonDisabled());
  AuthRepository authRepository = AppInjector.get<AuthRepository>();
  var _firebaseRepo = AppInjector.get<FirestoreRepository>();

  ProductModel _productModel;

  validateButton(String phoneNumber) {
    emit(AddProductState.onButtonEnabled());
  }

  saveData(String name, String description,
    String currency, num currentPrice, num actualPrice, double ratingStar,
    String uploadedFileURL,
    {bool isEdit = false}) async {
      print("saveData");
    if (isEdit) {
      _productModel = ProductModel();
    }
    
    _productModel.name = name;
    _productModel.description = description;
    _productModel.currency = currency;
    _productModel.currentPrice = currentPrice;
    _productModel.actualPrice = actualPrice;
    _productModel.image = uploadedFileURL;
    _productModel.categories = ["top_products"];
    _productModel.dealOfTheDay = true;
    _productModel.ratingStar = ratingStar;
    _productModel.productId = name;

    print(_productModel);
    emit(AddProductState.saveDataLoading());
    await _firebaseRepo.addProductDetails(_productModel);
    //await authRepository.setAccountDetails(displayName: _productModel.name);
    emit(AddProductState.savedSuccessfully());
    print("savedSuccessfully");
  }

}
