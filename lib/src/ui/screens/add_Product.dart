import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercommerce/src/bloc/add_account_details/add_account_details.dart';
import 'package:fluttercommerce/src/bloc/add_product/add_product.dart';
import 'package:fluttercommerce/src/core/utils/validator.dart';
import 'package:fluttercommerce/src/di/app_injector.dart';
import 'package:fluttercommerce/src/res/app_colors.dart';
import 'package:fluttercommerce/src/res/string_constants.dart';
import 'package:fluttercommerce/src/routes/router.gr.dart';
import 'package:fluttercommerce/src/ui/common/action_text.dart';
import 'package:fluttercommerce/src/ui/common/commom_text_field.dart';
import 'package:fluttercommerce/src/ui/common/common_app_loader.dart';
import 'package:fluttercommerce/src/ui/common/common_button.dart';
import 'package:rating_bar/rating_bar.dart';

class AddProductScreen extends StatefulWidget {
  final bool newAddress;

  AddProductScreen(this.newAddress);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  var addProductCubit = AppInjector.get<AddProductCubit>();

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController productDescriptionEditingController =
      TextEditingController();
  TextEditingController currencyEditingController = TextEditingController();
  TextEditingController currentPriceEditingController = TextEditingController();
  TextEditingController actualPriceEditingController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode productDescriptionFocusNode = FocusNode();
  FocusNode currencyFocusNode = FocusNode();
  FocusNode currentPriceFocusNode = FocusNode();
  FocusNode actualPriceFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Validator validator = Validator();
  String roleValue = 'Admin';
  double _ratingStar = 0;

  @override
  void initState() {
    super.initState();
    if (!widget.newAddress) {
      //addAddressCubit.loadPreviousData();
    }
    nameEditingController.addListener(() {
      print(nameEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
            "${widget.newAddress ? StringsConstants.add : StringsConstants.edit} ${StringsConstants.details}"),
      ),
      body: BlocConsumer<AddProductCubit, AddProductState>(
        cubit: addProductCubit,
        listener: (BuildContext context, AddProductState state) {
          state.when(
              idle: () {},
              onButtonEnabled: () {},
              onButtonDisabled: () {},
              saveDataLoading: () {},
              showError: (String error) {
                print(error);
                final snackBar = SnackBar(
                  content: Text(error),
                  action: SnackBarAction(
                    label: 'Ok',
                    onPressed: () {
                      print("Ok Button Clicked");
                    },
                  ),
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
              savedSuccessfully: () {
                nameEditingController.clear();
                productDescriptionEditingController.clear();
                currencyEditingController.clear();
                currentPriceEditingController.clear();
                actualPriceEditingController.clear();
                //setState(() => _ratingStar = 0);
                final snackBar = SnackBar(
                  content: Text("Saved Successfully"),
                  action: SnackBarAction(
                    label: 'Ok',
                    onPressed: () {
                      print("Ok Button Clicked");
                    },
                  ),
                );
                Scaffold.of(context).showSnackBar(snackBar);
              });
          if (state is Successful) {
            if (widget.newAddress) {
              Navigator.of(context).pushReplacementNamed(Router.mainHomeScreen);
            } else {
              Navigator.of(context).pop();
            }
          }
          if (state is EditData) {
            //nameEditingController.text = state..name;
          }
        },
        builder: (BuildContext context, AddProductState state) {
          if (state is Loading) {
            return Center(child: CommonAppLoader());
          } else {
            return saveDataView(state);
          }
        },
      ),
    );
  }

  Widget saveDataView(AddProductState state) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Visibility(
                visible: !widget.newAddress,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ActionText(StringsConstants.manageAddress, onTap: () {
                        Navigator.of(context).pushNamed(Router.myAddressScreen);
                      }),
                    ],
                  ),
                ),
              ),
              CustomTextField(
                hint: "Enter Name",
                textEditingController: nameEditingController,
                focusNode: nameFocusNode,
                nextFocusNode: productDescriptionFocusNode,
                validator: validator.validateName,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onSubmitted: (val) {
                  FocusScope.of(context).requestFocus(nameFocusNode);
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: "Enter Product Description",
                textEditingController: productDescriptionEditingController,
                focusNode: productDescriptionFocusNode,
                validator: validator.validateName,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onSubmitted: (val) {
                  //  FocusScope.of(context).requestFocus(phoneFocusNode);
                },
                // containerHeight: 50,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: "Enter Currency",
                textEditingController: currencyEditingController,
                focusNode: currencyFocusNode,
                validator: validator.validateName,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onSubmitted: (val) {
                  //  FocusScope.of(context).requestFocus(phoneFocusNode);
                },
                // containerHeight: 50,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: "Enter Currency Price",
                textEditingController: currentPriceEditingController,
                focusNode: currentPriceFocusNode,
                validator: validator.validateNum,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onSubmitted: (val) {
                  //  FocusScope.of(context).requestFocus(phoneFocusNode);
                },
                // containerHeight: 50,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: "Enter Actual Price",
                textEditingController: actualPriceEditingController,
                focusNode: actualPriceFocusNode,
                validator: validator.validateNum,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onSubmitted: (val) {
                  //  FocusScope.of(context).requestFocus(phoneFocusNode);
                },
                // containerHeight: 50,
              ),
              SizedBox(
                height: 20,
              ),
              RatingBar(
                onRatingChanged: (rating) =>
                    setState(() => _ratingStar = rating),
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                halfFilledIcon: Icons.star_half,
                isHalfAllowed: true,
                filledColor: Colors.green,
                emptyColor: Colors.redAccent,
                halfFilledColor: Colors.amberAccent, 
              ),
              CommonButton(
                title: widget.newAddress ? "Add" : "Edit",
                titleColor: AppColors.white,
                height: 50,
                isEnabled: isButtonEnabled(state),
                //replaceWithIndicator: state is SaveDataLoading ? true : false,
                margin: EdgeInsets.only(bottom: 40),
                onTap: () {
                  onButtonTap();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isButtonEnabled(AddProductState state) {
    // if (state is ButtonEnabled) {
    //   return true;
    // } else if (state is ButtonDisabled) {
    //   return false;
    // } else {
    //   return false;
    // }
    return true;
  }

  void onButtonTap() {
    if (_formKey.currentState.validate()) {
      addProductCubit.saveData(
          nameEditingController.text,
          productDescriptionEditingController.text,
          currencyEditingController.text,
          int.parse(currentPriceEditingController.text),
          int.parse(actualPriceEditingController.text),
          _ratingStar,
          isEdit: widget.newAddress);
    }
  }
}
