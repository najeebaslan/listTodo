import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:local_notifaiction/services/my_size.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:local_notifaiction/ui/widgets/style.dart';
import 'package:get/get.dart';

class ErrorResponse {
  static snackBarError(String error, BuildContext context, Color color) {
    return ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text(error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Get.isDarkMode ? color : Colors.white,
                  fontFamily: StyleWidget.fontName,
                  fontSize: MySize.size16,
                  fontWeight: FontWeight.w700
                  // color: Get.isDarkMode?Colors.grey[400]:Colors.grey,
                  ))));
  }

  static awesomeDialog(
      {required error,
      required BuildContext context,
      required DialogType dialogType,
      Color? color,
      String? btnCancel,
      String? describtion,
      Function()? btnOkOnPress,
      Function()? btnCancelOnPress}) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.SCALE,
      headerAnimationLoop: false,
      title: error.toString(),
      btnOkText: 'موافق',
      btnOkOnPress: btnOkOnPress ?? () {},
      btnCancelOnPress: btnCancelOnPress,
      btnCancelColor: btnOkOnPress != null ? Colors.grey[500] : null,
      btnCancelText: btnCancel,
      desc: describtion,
      buttonsTextStyle: TextStyle(
          fontFamily: 'Cairo',
          fontSize: MySize.size16,
          fontWeight: FontWeight.w700),
      btnOkColor: color ?? Colors.green,
    ).show();
  }

  static convertStringToInt(TextEditingController controller, String? err,
      Color color, BuildContext context) {
    try {
      return int.parse(controller.text);
    } catch (e) {
      return snackBarError(err!, context, color);
    }
  }

  static String? valdationTextField(
    val,
    error,
    lengthMin,
    lengthMax,
    intMain,
    intMax,
  ) {
    if (val.text != null && val.text.isEmpty) {
      return error.toString();
    } else if (val.text!.length < intMain) {
      return lengthMin.toString();
    } else if (val.text!.length > intMax) {
      return lengthMax.toString();
    }
  }

  static String? validationName(_nameController) {
    return ErrorResponse.valdationTextField(
        _nameController,
        "يجب إدخال الاسم",
        'الاسم يجب ان لا يقل عن 6 احرف',
        'الاسم يجب ان لا يزيد عن 30 حرف',
        6,
        30);
  }

  static String? validationIssue(_issueController) {
    return ErrorResponse.valdationTextField(
        _issueController,
        "يجب إدخال التهمة",
        'التهمة يجب ان لا تقل عن 3 احرف',
        'التهمة يجب ان لا تزيد عن 30 حرف',
        3,
        30);
  }

  static String? validationIssueNumber(_issueNumberController) {
    return ErrorResponse.valdationTextField(
        _issueNumberController,
        "يجب إدخال رقم القضية",
        'رقم القضية يجب ان لا تقل عن  رقم (1)',
        'رقم القضية يجب ان لا تزيد عن  رقم (20)',
        1,
        20);
  }

  static String? validationPhoneNumber(_phoneNumberController) {
    return ErrorResponse.valdationTextField(
        _phoneNumberController,
        "يجب إدخال رقم الهاتف",
        'رقم الهاتف يجب ان لا تقل عن 9 ارقام ',
        'رقم القضية يجب ان لا تزيد عن 9 ارقام',
        9,
        9);
  }

  static String? autovaldationPhone(error, lengthMin, lengthMax, intMain,
      intMax, TextEditingController contoller, String reges) {
    RegExp regExp = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    if (contoller.text.startsWith(' ') || contoller.text.endsWith(' ')) {
      return 'يجب ان لا بداءالنص بفراغ';
    } else if (contoller.text.isEmpty) {
      return error.toString();
    } else if (!regExp.hasMatch(contoller.text)) {
      return ' رقم الهاتف غير صالح';
    } else if (contoller.text.length < intMain) {
      return lengthMin.toString();
    } else if (contoller.text.length > intMax) {
      return lengthMax.toString();
    }
  }

  Center buildNoTasks(ThemeData theme, String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.sentiment_dissatisfied,
                size: MySize.size100,
                color: Colors.redAccent,
              ),
              Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: MySize.size10,
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: StyleWidget.fontName,
                  ),
                ).paddingAll(5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
