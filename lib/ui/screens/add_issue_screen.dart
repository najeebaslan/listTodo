import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:intl/intl.dart' as intl;

import 'package:local_notifaiction/Api/issue_provider.dart';
import 'package:local_notifaiction/localizition/type_language.dart';
import 'package:local_notifaiction/models/task.dart';
import 'package:local_notifaiction/services/my_size.dart';
import 'package:local_notifaiction/services/notification_services.dart';
import 'package:local_notifaiction/ui/widgets/button.dart';
import 'package:local_notifaiction/ui/widgets/input_feild.dart';
import 'package:local_notifaiction/ui/widgets/style.dart';
import 'package:local_notifaiction/utils/error_response.dart';
import 'package:local_notifaiction/utils/utils_functions.dart';
import 'package:nb_utils/src/extensions/int_extensions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navigation_bar_screen.dart';

class AddTaskPage extends StatefulWidget {
  final Issue? issue;
  const AddTaskPage({Key? key, required this.issue}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  // final TaskController _chargeController = Get.put(TaskController());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _issueController = TextEditingController();
  final _phoneController = TextEditingController();
  final TextEditingController _issueNumberController = TextEditingController();

  bool lan = false;
  int _selectedColor = 0;

  DateTime _selectedDate = DateTime.now();

  Future<bool> getLangaueg() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(LANGUAGEkEY);
    //MySharedPreferences.getLanguageType();
    if (data == 'English') {
      setState(() {
        lan = true;
      });
      return true;
    } else {
      setState(() {
        lan = false;
      });
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    getLangaueg();
    if (widget.issue != null) {
      _nameController.text = widget.issue!.name.toString();
      _issueController.text = widget.issue!.issue.toString();
      _issueNumberController.text = widget.issue!.issueNumber.toString();
      _phoneController.text = widget.issue!.phoneNu.toString();
      _noteController.text = widget.issue!.note ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _issueController.dispose();
    _issueNumberController.dispose();
    _phoneController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: lan ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: widget.issue != null
            ? AppBar(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black
                      ),
                ),
              )
            : null,
        body: Container(
          padding: EdgeInsets.only(
              left: MySize.size20!, right: MySize.size20!, top: MySize.size20!),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  widget.issue == null
                      ? 'اظافة بيانات المتهم'
                      : 'تعديل بيانات المتهم',
                  style: headingStyle,
                ),
                MyInputField(
                  title: 'الاسم',
                  hint: 'أدخل الاسم الكامل',
                  controller: _nameController,
                  textInputType: TextInputType.text,
                ),
                MyInputField(
                  title: 'التهمة',
                  hint: 'أدخل التهمة',
                  controller: _issueController,
                  textInputType: TextInputType.text,
                ),
                MyInputField(
                  title: 'الهاتف',
                  hint: 'أدخل رقم الهاتف',
                  controller: _phoneController,
                  textInputType: TextInputType.phone,
                ),
                MyInputField(
                  title: 'رقم القضية',
                  hint: 'أدخل رقم القضية',
                  controller: _issueNumberController,
                  textInputType: TextInputType.text,
                ),
                widget.issue != null
                    ? MyInputField(
                        title: 'التاريخ',
                        hint: intl.DateFormat.yMd().format(
                            DateTime.parse(widget.issue!.date.toString())),
                        // widget: IconButton(
                        //   icon: const Icon(
                        //     Icons.calendar_today_outlined,
                        //     color: Colors.grey,
                        //   ),
                        //   onPressed: () {
                        //     // _getDataFromUser();
                        //   },
                        // ),
                        textInputType: TextInputType.datetime,
                      )
                    : const SizedBox(),
                MyInputField(
                  title: 'الملاحظة',
                  hint: 'أدخل الملاحظة',
                  controller: _noteController,
                  textInputType: TextInputType.text,
                ),
                18.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.issue == null ? _colorPallet() : const SizedBox(),
                    MyButton(
                        label: widget.issue == null ? 'إضافة' : 'تعديل',
                        onTap: () async => await _validateDate())
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _validateDate() async {
    if (ErrorResponse.validationName(_nameController) != null) {
      return ErrorResponse.snackBarError(
        ErrorResponse.validationName(_nameController)!,
        context,
        pinkClr,
      );
    } else if (ErrorResponse.validationIssue(_issueController) != null) {
      return ErrorResponse.snackBarError(
        ErrorResponse.validationIssue(_issueController)!,
        context,
        pinkClr,
      );
    } else if (ErrorResponse.validationIssueNumber(_issueNumberController) !=
        null) {
      return ErrorResponse.snackBarError(
        ErrorResponse.validationIssueNumber(_issueNumberController)!,
        context,
        pinkClr,
      );
    } else if (ErrorResponse.autovaldationPhone(
            "يجب ادخال رقم الهاتف",
            'الرجاء إدخال 9 ارقام با الأقل',
            'الرجاء إدخال 9 ارقام با الاكثر',
            9,
            9,
            _phoneController,
            "^[0-9]") !=
        null) {
      return ErrorResponse.snackBarError(
        ErrorResponse.autovaldationPhone(
            "يجب ادخال رقم الهاتف",
            'الرجاء إدخال 9 ارقام با الأقل',
            'الرجاء إدخال 9 ارقام با الاكثر',
            9,
            9,
            _phoneController,
            "^[0-9]")!,
        context,
        pinkClr,
      );
    } else {
      if (_nameController.text.isNotEmpty &&
          _issueNumberController.text.isNotEmpty &&
          _issueController.text.isNotEmpty) {
        return await _addTaskToDb();
      }
    }
  }

//this is for selscted date
  _getDataFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print('it is null or something is wrong');
    }
  }

  _colorPallet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الون',
          style: titleStyle,
        ),
        8.height,
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index == 0
                          ? primaryClr
                          : index == 1
                              ? pinkClr
                              : yellowClr,
                      child: _selectedColor == index
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 16,
                            )
                          : Container())
                  .paddingOnly(right: 8.0),
            );
          }),
        )
      ],
    );
  }

  _addTaskToDb() async {
    try {
/* -------------------------------------- THIS IS FOR ADD DATE ------------------------------------------ */

      if (widget.issue == null) {
        int savedate = await context
            .read<IssueProvder>()
            .addIssue(Issue(
                note:
                    _noteController.text.isNotEmpty ? _noteController.text : '',
                issue: _issueController.text.toString(),
                issueNumber: _issueNumberController.text.toString(),
                name: _nameController.text.toString(),
                date: DateTime.now().toString(),
                color: _selectedColor,
                isCompleted: 0,
                phoneNu: int.parse(_phoneController.text.toString())))
            .onError((error, stackTrace) => ErrorResponse.awesomeDialog(
                  error: error.toString(),
                  context: context,
                  dialogType: DialogType.ERROR,
                ));

        if (savedate is int) {
          DateTime dateTime = DateTime.now();
          print(savedate.toString() + 'This is My id');
          return await NotifyHelper()
              .scheduledNotification(
                  savedate,
                  dateTime,
                  _nameController.text.toString(),
                  _issueController.text,
                  _noteController.text.toString())
              .then((value) async {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const MyNavigationBar()),
                (Route<dynamic> route) => route is NavigationBar);
          });
        }
      } else {
/* --------------------------------------THIS IS FOR ADD EDITE ------------------------------------------ */

        int updateDate = await context
            .read<IssueProvder>()
            .updateIssue(Issue(
                note:
                    _noteController.text.isNotEmpty ? _noteController.text : '',
                issue: _issueController.text.toString(),
                issueNumber: _issueNumberController.text.toString(),
                name: _nameController.text.toString(),
                date: _selectedDate.toString(),
                id: widget.issue!.id,
                phoneNu: int.parse(_phoneController.text.toString())))
            .onError((error, stackTrace) {
          log(error.toString());
          log(stackTrace.toString());

          return ErrorResponse.awesomeDialog(
            error: stackTrace.toString(),
            context: context,
            dialogType: DialogType.ERROR,
          );
        });

        if (updateDate is int) {
          print(updateDate.toString() + 'This is My id');
          return await NotifyHelper()
              .cancelNotificationById(widget.issue!.id!)
              .then((value) async {
            return await NotifyHelper()
                .scheduledNotification(
                    widget.issue!.id!,
                    _selectedDate,
                    _nameController.text.toString(),
                    _issueController.text,
                    _noteController.text.toString())
                .then((value) async {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const MyNavigationBar()),
                  (Route<dynamic> route) => route is NavigationBar);
              print(updateDate.toString() + 'My Id ');
            });
          });
        }
      }
    } catch (e) {
      log('this is The Error====>$e');
      ErrorResponse.awesomeDialog(
        error: e.toString(),
        context: context,
        dialogType: DialogType.ERROR,
      );
    }
  }
}
