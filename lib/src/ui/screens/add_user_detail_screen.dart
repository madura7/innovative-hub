import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercommerce/src/bloc/add_account_details/add_account_details.dart';
import 'package:fluttercommerce/src/core/utils/validator.dart';
import 'package:fluttercommerce/src/di/app_injector.dart';
import 'package:fluttercommerce/src/res/app_colors.dart';
import 'package:fluttercommerce/src/res/string_constants.dart';
import 'package:fluttercommerce/src/routes/router.gr.dart';
import 'package:fluttercommerce/src/ui/common/action_text.dart';
import 'package:fluttercommerce/src/ui/common/commom_text_field.dart';
import 'package:fluttercommerce/src/ui/common/common_app_loader.dart';
import 'package:fluttercommerce/src/ui/common/common_button.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class AddUserDetailScreen extends StatefulWidget {
  final bool newAddress;

  AddUserDetailScreen(this.newAddress);

  @override
  _AddUserDetailScreenState createState() => _AddUserDetailScreenState();
}

class _AddUserDetailScreenState extends State<AddUserDetailScreen> {
  var addAddressCubit = AppInjector.get<AddAccountDetailsCubit>();

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();
  TextEditingController userRoleEditingController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode userRoleFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Validator validator = Validator();

  String roleValue;
  bool membershipStatus = false;
  final List<DropdownMenuItem> items = [];

  @override
  void initState() {
    
    setDropDownValues();
    super.initState();
    if (!widget.newAddress) {
      addAddressCubit.loadPreviousData();
    }
    nameEditingController.addListener(() {
      addAddressCubit.validateButton(
          nameEditingController.text, phoneNumberEditingController.text);
    });
    phoneNumberEditingController.addListener(() {
      addAddressCubit.validateButton(
          nameEditingController.text, phoneNumberEditingController.text);
    });
    //userRoleEditingController.text = "Admin";
  }

  setDropDownValues(){
    items.add(DropdownMenuItem(
      child: Text("Admin"),
      value: "Admin",
    ));
    items.add(DropdownMenuItem(
      child: Text("Buyer"),
      value: "Buyer",
    ));
    items.add(DropdownMenuItem(
      child: Text("Seller"),
      value: "Seller",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
            "${widget.newAddress ? StringsConstants.add : StringsConstants.edit} ${StringsConstants.details}"),
      ),
      body: BlocConsumer<AddAccountDetailsCubit, AddAccountDetailsState>(
        cubit: addAddressCubit,
        listener: (BuildContext context, AddAccountDetailsState state) {
          if (state is Successful) {
            if (widget.newAddress) {
              Navigator.of(context).pushReplacementNamed(Router.mainHomeScreen);
            } else {
              Navigator.of(context).pop();
            }
          }
          if (state is EditData) {
            nameEditingController.text = state.accountDetails.name;
            phoneNumberEditingController.text = state.accountDetails.phoneNumber;
            roleValue = state.accountDetails.userRole;
            membershipStatus = state.accountDetails.membershipStatus ?? false;
          }
        },
        builder: (BuildContext context, AddAccountDetailsState state) {
          if (state is Loading) {
            return Center(child: CommonAppLoader());
          } else {
            return saveDataView(state);
          }
        },
      ),
    );
  }

  Widget saveDataView(AddAccountDetailsState state) {
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
                nextFocusNode: phoneFocusNode,
                validator: validator.validateName,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onSubmitted: (val) {
                  FocusScope.of(context).requestFocus(phoneFocusNode);
                },
                // containerHeight: 50,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: "Enter Phone Number",
                textEditingController: phoneNumberEditingController,
                focusNode: phoneFocusNode,
                validator: validator.validateMobile,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onSubmitted: (val) {
                  //  FocusScope.of(context).requestFocus(phoneFocusNode);
                },
                // containerHeight: 50,
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // CustomTextField(
              //   hint: "Enter User Role",
              //   textEditingController: userRoleEditingController,
              //   focusNode: userRoleFocusNode,
              //   validator: validator.validateName,
              //   keyboardType: TextInputType.number,
              //   textInputAction: TextInputAction.next,
              //   onSubmitted: (val) {
              //     //  FocusScope.of(context).requestFocus(phoneFocusNode);
              //   },
              //   // containerHeight: 50,
              // ),
              SizedBox(
                height: 20,
              ),

              SearchableDropdown.single(
                items: items,
                value: roleValue,
                hint: "Select one",
                searchHint: "Select one",
                onChanged: (value) {
                  setState(() {
                    roleValue = value;
                  });
                },
                isExpanded: true,
              ),

              SizedBox(
                height: 20,
              ),
              CommonButton(
                title: "Apply For Membership",
                titleColor: AppColors.white,
                height: 50,
                isEnabled: !membershipStatus,
                replaceWithIndicator: state is SaveDataLoading ? true : false,
                margin: EdgeInsets.only(bottom: 20),
                onTap: () {
                  onButtonTapApplyMembership();
                },
              ),

              CommonButton(
                title: widget.newAddress ? "Add" : "Edit",
                titleColor: AppColors.white,
                height: 50,
                isEnabled: isButtonEnabled(state),
                replaceWithIndicator: state is SaveDataLoading ? true : false,
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

  bool isButtonEnabled(AddAccountDetailsState state) {
    if (state is ButtonEnabled) {
      return true;
    } else if (state is ButtonDisabled) {
      return false;
    } else {
      return false;
    }
  }

  void onButtonTap() {
    print("selected value");
    print(roleValue);
    if (_formKey.currentState.validate()) {
      addAddressCubit.saveData(nameEditingController.text,
          phoneNumberEditingController.text, roleValue, membershipStatus,
          isEdit: widget.newAddress);
    }
  }


  void onButtonTapApplyMembership() {
    print("onButtonTapApplyMembership");
    setState(() {
      membershipStatus = true;
    });
    if (_formKey.currentState.validate()) {
      addAddressCubit.saveData(nameEditingController.text,
          phoneNumberEditingController.text, roleValue, membershipStatus,
          isEdit: widget.newAddress);
    }
  }


}
