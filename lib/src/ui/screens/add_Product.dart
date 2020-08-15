import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
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
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

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

  PickedFile _imageFile;
  File imageFile;
  dynamic _pickImageError;
  String _retrieveDataError;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  String _uploadedFileURL;

  @override
  void initState() {
    super.initState();
    if (!widget.newAddress) {
      //addAddressCubit.loadPreviousData();
    }
    nameEditingController.addListener(() {
      print(nameEditingController.text);
    });
    setState(() {
      maxWidthController.text = "100";
      maxHeightController.text = "100";
      qualityController.text = "100";
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _onImageButtonPressed(ImageSource.gallery, context: context);
            },
            heroTag: 'image0',
            backgroundColor: Colors.red,
            tooltip: 'Pick Image from gallery',
            child: const Icon(Icons.photo_library),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                // isVideo = false;
                _onImageButtonPressed(ImageSource.camera, context: context);
              },
              heroTag: 'image1',
              tooltip: 'Take a Photo',
              backgroundColor: Colors.red,
              child: const Icon(Icons.camera_alt),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.only(top: 16.0),
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.red,
          //     onPressed: () {
          //       //isVideo = true;
          //       _onImageButtonPressed(ImageSource.gallery);
          //     },
          //     heroTag: 'video0',
          //     tooltip: 'Pick Video from gallery',
          //     child: const Icon(Icons.video_library),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 16.0),
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.red,
          //     onPressed: () {
          //       //isVideo = true;
          //       _onImageButtonPressed(ImageSource.camera);
          //     },
          //     heroTag: 'video1',
          //     tooltip: 'Take a Video',
          //     child: const Icon(Icons.videocam),
          //   ),
          // ),
        ],
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
              SizedBox(
                height: 20,
              ),
              _previewImage(),
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

  void onButtonTap() async {
    if (_formKey.currentState.validate()) {
      if (_imageFile != null) {
        await uploadFile();
        print("save product");
        print(_uploadedFileURL);
        addProductCubit.saveData(
            nameEditingController.text,
            productDescriptionEditingController.text,
            currencyEditingController.text,
            int.parse(currentPriceEditingController.text),
            int.parse(actualPriceEditingController.text),
            _ratingStar,
            _uploadedFileURL,
            isEdit: widget.newAddress);
      }else{
        print("Please Select Image");
      }
    }
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      if (false) {
        // Why network?
        // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
        return Image.network(_imageFile.path);
      } else {
        return Image.file(File(_imageFile.path));
      }
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    // if (_controller != null) {
    //   await _controller.setVolume(0.0);
    // }
    if (false) {
      final PickedFile file = await _picker.getVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      //await _playVideo(file);
    } else {
      // await _displayPickImageDialog(context,
      //     (double maxWidth, double maxHeight, int quality) async {
      await _displayPickImageDialog(context,
          (double maxWidth, double maxHeight, int quality) async {
        try {
          // var image = await ImagePicker.pickImage(source: ImageSource.gallery);

          final pickedFile = await _picker.getImage(
            source: source,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );

          setState(() {
            _imageFile = pickedFile;
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    }
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Pick an image'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: "Enter maxWidth if desired"),
                  enabled: false,
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: "Enter maxHeight if desired"),
                  enabled: false,
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(hintText: "Enter quality if desired"),
                  enabled: false,
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    double width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    double height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    int quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  Future uploadFile() async {
    print('Before File Upload');
    File tmpFile = File(_imageFile.path);
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('Products/${Path.basename(tmpFile.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(tmpFile);
    await uploadTask.onComplete;
    print('File Uploaded');
    await storageReference.getDownloadURL().then((fileURL) {
      print("fileURL");
      print(fileURL);
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }
}

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);
