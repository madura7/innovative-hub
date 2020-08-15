//import 'dart:html';

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercommerce/src/bloc/payment/payment.dart';
import 'package:fluttercommerce/src/bloc/place_order/place_order_cubit.dart';
import 'package:fluttercommerce/src/bloc/place_order/place_order_state.dart';
import 'package:fluttercommerce/src/bloc/send_email/send_email_cubit.dart';
import 'package:fluttercommerce/src/core/utils/validator.dart';
import 'package:fluttercommerce/src/di/app_injector.dart';
import 'package:fluttercommerce/src/notifiers/account_provider.dart';
import 'package:fluttercommerce/src/notifiers/cart_status_provider.dart';
import 'package:fluttercommerce/src/notifiers/provider_notifier.dart';
import 'package:fluttercommerce/src/res/app_colors.dart';
import 'package:fluttercommerce/src/res/string_constants.dart';
import 'package:fluttercommerce/src/res/text_styles.dart';
import 'package:fluttercommerce/src/routes/router.gr.dart';
import 'package:fluttercommerce/src/ui/common/PaypalPayment.dart';
import 'package:fluttercommerce/src/ui/common/action_text.dart';
import 'package:fluttercommerce/src/ui/common/cart_item_card.dart';
import 'package:fluttercommerce/src/ui/common/commom_text_field.dart';
import 'package:fluttercommerce/src/ui/common/common_button.dart';
import 'package:fluttercommerce/src/ui/common/common_card.dart';
import 'package:fluttercommerce/src/ui/screens/base_screen_mixin.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with BaseScreenMixin {
  var paymentCubit = AppInjector.get<PaymentCubit>();
  var placeOrderCubit = AppInjector.get<PlaceOrderCubit>();
  var emailCubit = AppInjector.get<SendEmailCubit>();

  TextEditingController couponController = TextEditingController();
  Validator validator = Validator();
  double couponAppliedValue = 0;
  bool couponAppliedStatus = false;

  @override
  void initState() {
    super.initState();
    couponController.addListener(() {
      print(couponController.text);
      if (couponController.text.toUpperCase() ==
          StringsConstants.staticCouponCode1.toUpperCase() || 
          couponController.text.toUpperCase() ==
          StringsConstants.staticCouponCode2.toUpperCase() || 
          couponController.text.toUpperCase() ==
          StringsConstants.staticCouponCode3.toUpperCase()) {
        print("applied");
        setState(() {
          couponAppliedValue = 0.9; //HARDCODED VALUE FOR COUPON 10%
          couponAppliedStatus = true;
        });
      } else {
        print("not applied");
        setState(() {
          couponAppliedValue = 0;
          couponAppliedStatus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProviderNotifier<CartStatusProvider>(
      child: (CartStatusProvider cartItemStatus) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: AppColors.colorF8F8F8,
          appBar: AppBar(
            title: Text(StringsConstants.cart),
            elevation: 1,
          ),
          body: cartItemStatus.noOfItemsInCart > 0
              ? cartView(cartItemStatus)
              : Container(),
          bottomNavigationBar: Visibility(
              visible: cartItemStatus.noOfItemsInCart > 0,
              child: checkOut(cartItemStatus)),
        );
      },
    );
  }

  Widget cartView(CartStatusProvider cartItemStatus) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 10, left: 10, top: 21),
          child: Column(
            children: [
              Container(
                //  margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: List<Widget>.generate(
                      cartItemStatus.cartItems.length, (index) {
                    return CartItemCard(
                      cartModel: cartItemStatus.cartItems[index],
                      margin: EdgeInsets.only(bottom: 20),
                    );
                  }),
                ),
              ),
              billDetails(cartItemStatus),
              SizedBox(
                height: 20,
              ),
              deliverTo(),
              SizedBox(
                height: 50,
              ),
              // applyCoupon(),
              // SizedBox(
              //   height: 50,
              // ),
              apply(),

              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget applyCoupon() {
    return CommonCard(
        child: Container(
      margin: EdgeInsets.only(left: 20, right: 14, top: 17, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_offer,
                color: AppColors.color81819A,
              ),
              SizedBox(
                width: 10,
              ),
              Text(StringsConstants.applyCoupon),
            ],
          ),
          IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              color: AppColors.color81819A,
              onPressed: (() => {
                    print("Apply Coupon"),
                  })),
        ],
      ),
    ));
  }

  Widget apply() {
    return CommonCard(
      child: Container(
          child: Column(children: [
        CustomTextField(
          fillColor: Colors.white,
          textEditingController: couponController,
          hint: StringsConstants.applyCoupon,
          validator: validator.validateName,
          keyboardType: TextInputType.text,
        ),
        Text(couponAppliedStatus ? StringsConstants.couponAppliedMsg : ""),
      ])),
    );
  }

  Widget billDetails(CartStatusProvider cartItemStatus) {
    Widget priceRow(String title, String price, {bool isFinal = false}) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$title",
                style: TextStyle(
                    color: AppColors.color20203E,
                    fontSize: 14,
                    fontWeight: isFinal ? FontWeight.w500 : null),
              ),
              Text(
                "$price",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: isFinal ? FontWeight.w500 : null),
              ),
            ],
          ),
          Visibility(
            visible: !isFinal,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Divider()
              ],
            ),
          )
        ],
      );
    }

    return CommonCard(
        child: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsConstants.billDetails,
            style: AppTextStyles.medium14Black,
          ),
          SizedBox(
            height: 20,
          ),
//          priceRow(
//              StringsConstants.basketTotal,
//              "${cartItemStatus.currency}${cartItemStatus.priceInCart}"),
//          priceRow(
//              StringsConstants.taxAndCharges, "${cartItemStatus.currency}900"),
          priceRow(
              StringsConstants.toPay,
              "${cartItemStatus.currency} "
              " ${cartItemStatus.priceInCart * (couponAppliedStatus ? couponAppliedValue : 1)}",
              isFinal: true),
        ],
      ),
    ));
  }

  Widget deliverTo() {
    return ProviderNotifier<AccountProvider>(
      child: (AccountProvider accountProvider) {
        return CommonCard(
            child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringsConstants.deliverTo,
                    style: AppTextStyles.medium14Black,
                  ),
                  ActionText(
                    accountProvider.addressSelected == null
                        ? StringsConstants.addNewCaps
                        : StringsConstants.changeTextCapital,
                    onTap: () {
                      if (accountProvider.addressSelected == null) {
                        Navigator.pushNamed(context, Router.addAddressScreen,
                            arguments: AddAddressScreenArguments(
                              newAddress: true,
                              accountDetails: accountProvider.accountDetails,
                            ));
                      } else {
                        Navigator.of(context)
                            .pushNamed(Router.myAddressScreen, arguments: true);
                      }
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                accountProvider.addressSelected?.wholeAddress() ??
                    StringsConstants.noAddressFound,
                style: AppTextStyles.medium12Color81819A,
              ),
            ],
          ),
        ));
      },
    );
  }

  Widget checkOut(CartStatusProvider cartItemStatus) {
    return Container(
      height: 94,
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${cartItemStatus.currency} "
                      "${cartItemStatus.priceInCart * (couponAppliedStatus ? couponAppliedValue : 1)}",
                      style: AppTextStyles.medium15Black,
                    ),
                    ActionText(
                      StringsConstants.sendInvoiceEmail,
                      onTap: () {
                        print("Detailed Bill");
                        emailCubit.sendEmail(cartItemStatus);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          BlocConsumer<PaymentCubit, PaymentState>(
            cubit: paymentCubit,
            listener: (BuildContext context, PaymentState state) {
              if (state is PaymentSuccessful) {
                placeOrderCubit.placeOrder(
                  cartItemStatus,
                  state.response,
                );
              }
            },
            builder: (BuildContext context, PaymentState paymentState) {
              return BlocConsumer<PlaceOrderCubit, PlaceOrderState>(
                cubit: placeOrderCubit,
                listener: (BuildContext context, PlaceOrderState state) {
                  state.when(
                      orderPlacedInProgress: () {},
                      idle: () {},
                      orderNotPlaced: (String message) {},
                      orderSuccessfullyPlaced: () {
                        if (Navigator.canPop(context)) {
                          Navigator.of(context)
                              .pushReplacementNamed(Router.myOrdersScreen);
                        }
                      });
                },
                builder:
                    (BuildContext context, PlaceOrderState placeOrderState) {
                  return CommonButton(
                    title: StringsConstants.makePayment,
                    width: 190,
                    height: 50,
                    replaceWithIndicator:
                        (placeOrderState is OrderPlacedInProgress ||
                                paymentState is PaymentButtonLoading)
                            ? true
                            : false,
                    margin: EdgeInsets.only(right: 20),
                    onTap: () {
                      var addressProvider = AppInjector.get<AccountProvider>();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => PaypalPayment(
                            onFinish: (number) async {
                              // payment done
                              print('order id: ' + number);
                            },
                          ),
                        ),
                      );

                      // if (addressProvider.addressSelected != null) {
                      //   paymentCubit.openCheckout(cartItemStatus.priceInCart);
                      // } else {
                      //   showSnackBar(title: StringsConstants.noAddressSelected);
                      // }
                    },
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
