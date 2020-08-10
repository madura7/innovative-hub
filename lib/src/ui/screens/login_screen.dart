import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercommerce/src/core/utils/validator.dart';
import 'package:fluttercommerce/src/bloc/phone_login/phone_login.dart';
import 'package:fluttercommerce/src/di/app_injector.dart';
import 'package:fluttercommerce/src/res/string_constants.dart';
import 'package:fluttercommerce/src/res/styles.dart';
import 'package:fluttercommerce/src/res/text_styles.dart';
import 'package:fluttercommerce/src/routes/router.gr.dart';
import 'package:fluttercommerce/src/ui/common/commom_text_field.dart';
import 'package:fluttercommerce/src/ui/common/common_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phoneLoginCubit = AppInjector.get<PhoneLoginCubit>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Validator validator = Validator();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // phoneNumberController.addListener(() {
    //   print(phoneNumberController.text);
    //   phoneLoginCubit.validateButton(phoneNumberController.text);
    // });
    emailController.addListener(() {
      print(emailController.text);
      phoneLoginCubit.validateButton(emailController.text);
    });
    passwordController.addListener(() {
      print(passwordController.text);
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
              // backgroundColor: Styles.transparent,
//            floatingActionButton: _floatingActionButton(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              body: Container(
                child: Column(
                  children: <Widget>[_loginCard()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginCard() {
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
              // CustomTextField(
              //   textEditingController: phoneNumberController,
              //   hint: StringsConstants.mobileNumber,
              //   validator: validator.validateMobile,
              //   keyboardType: TextInputType.phone,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              CustomTextField(
                textEditingController: emailController,
                hint: StringsConstants.email,
                validator: validator.validateEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                textEditingController: passwordController,
                hint: StringsConstants.password,
                validator: validator.validatePassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<PhoneLoginCubit, PhoneLoginState>(
                cubit: phoneLoginCubit,
                listener: (BuildContext context, PhoneLoginState state) {
                  state.when(
                    idle: () {},
                    onButtonEnabled: () {},
                    onButtonDisabled: () {},
                    phoneLoading: () {},
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
                    loginSuccessFull: () {
                    print("loginSuccessFull");
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Router.checkStatusScreen, (route) => false,
                        arguments: true);
                  });
                },
                builder: (BuildContext context, PhoneLoginState state) {
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
              CommonButton(
                title: StringsConstants.registerText,
                height: 50,
                isEnabled: true,
                replaceWithIndicator:
                    ButtonEnabled is PhoneLoading ? true : false,
                onTap: () {
                  onButtonRegisterTap();
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
      print(
          emailController.text.trim() + " - " + passwordController.text.trim());
      phoneLoginCubit.loginWithEmail(
          emailController.text.trim(), passwordController.text.trim());
    }
  }

  void onButtonRegisterTap() {
    Navigator.of(context)
        .pushNamed(Router.addUserScreen,
            arguments: (phoneNumberController.text.trim()))
        .then((value) {
      if (value != null && value) {
        phoneNumberController.clear();
      }
    });
  }
}
