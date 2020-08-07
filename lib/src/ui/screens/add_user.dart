import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercommerce/src/core/utils/validator.dart';
import 'package:fluttercommerce/src/bloc/add_user/add_user.dart';
import 'package:fluttercommerce/src/di/app_injector.dart';
import 'package:fluttercommerce/src/res/string_constants.dart';
import 'package:fluttercommerce/src/res/styles.dart';
import 'package:fluttercommerce/src/res/text_styles.dart';
import 'package:fluttercommerce/src/routes/router.gr.dart';
import 'package:fluttercommerce/src/ui/common/commom_text_field.dart';
import 'package:fluttercommerce/src/ui/common/common_button.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  var addUserCubit = AppInjector.get<AddUserCubit>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Validator validator = Validator();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      print(emailController.text);
      addUserCubit.validateButton(emailController.text);
    });
    passwordController.addListener(() {
      print(passwordController.text);
      addUserCubit.validateButton(passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Material(
            elevation: 5,
            child: Container(
              height: 250,
              width: width,
              decoration: BoxDecoration(
                gradient: Styles.appBackGradient,
              ),
            ),
          ),
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              body: Container(
                child: Column(
                  children: <Widget>[_registerCard()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _registerCard() {
    return Card(
      margin: EdgeInsets.only(top: 50, right: 16, left: 16),
      child: Container(
        margin: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                StringsConstants.login,
                style: AppTextStyles.medium20Color20203E,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                StringsConstants.phoneLoginText,
                style: AppTextStyles.normal14Black,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                textEditingController: emailController,
                hint: StringsConstants.email,
                validator: validator.validateEmail,
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                textEditingController: passwordController,
                hint: StringsConstants.password,
                validator: validator.validatePassword,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<AddUserCubit, AddUserState>(
                cubit: addUserCubit,
                listener: (BuildContext context, AddUserState state) {
                  state.when(
                      idle: () {},
                      onButtonEnabled: () {},
                      showError: (String error) {
                        print(error);
                      },
                      phoneLoading: () {},
                      onButtonDisabled: () {},
                      registerSuccessfully: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Router.loginScreen, (route) => false,
                            arguments: true);
                      });                     
                },
                builder: (BuildContext context, AddUserState state) {
                  bool isButtonEnabled() {
                    if (state is ButtonEnabled) {
                      return true;
                    } else if (state is ButtonDisabled) {
                      return false;
                    } else {
                      return true;
                    }
                  }

                  return CommonButton(
                    title: StringsConstants.continueText,
                    height: 50,
                    isEnabled: isButtonEnabled(),
                    replaceWithIndicator: state is PhoneLoading ? true : false,
                    onTap: () {
                      onButtonTap();
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onButtonTap() {
   if (_formKey.currentState.validate()) {
      addUserCubit.registerNewUser(emailController.text, passwordController.text);
      
    }
  }
}
