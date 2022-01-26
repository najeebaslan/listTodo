import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_notifaiction/Api/issue_provider.dart';
import 'package:local_notifaiction/models/task.dart';
import 'package:local_notifaiction/services/my_size.dart';
import 'package:local_notifaiction/ui/screens/add_issue_screen.dart';
import 'package:local_notifaiction/ui/screens/navigation_bar_screen.dart';
import 'package:local_notifaiction/utils/error_response.dart';
import 'package:local_notifaiction/utils/utils_functions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/int_extensions.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:provider/src/provider.dart';
import 'custom_transitions.dart';
import 'style.dart';

class ShowBottomSheet {
  static costumBottomSheet(
      {required final Issue issue,
      // required final IssueProvder taskController,
      required BuildContext context,
      required int key,
      required void Function(void Function() fn) setState,
      required ThemeData themeData}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: themeData.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MySize.size16!),
                      topRight: Radius.circular(MySize.size16!))),
              child: Padding(
                padding: EdgeInsets.all(MySize.size16!),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.close_outlined,
                          color: Colors.black,
                        ).onTap(() {
                          Navigator.pop(context);
                        }),
                        Expanded(
                          child: ListTile(
                            dense: true,
                            leading: Icon(MdiIcons.contentSaveEditOutline,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(220)),
                            title: Text(
                              "تعديل",
                              style: themeData.textTheme.bodyText1!.merge(
                                  TextStyle(
                                      color: themeData.colorScheme.onBackground,
                                      letterSpacing: 0.3,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CostumNvigator(AddTaskPage(
                                    issue: issue,
                                  )));
                            },
                          ),
                        ),
                      ],
                    ),
                    // Container(
                    //     margin: EdgeInsets.only(
                    //         left: MySize.size12!, bottom: MySize.size8!),
                    //     child: Text(
                    //       "CREATE",
                    //       style: themeData.textTheme.caption!.merge(TextStyle(
                    //           color: themeData.colorScheme.onBackground
                    //               .withAlpha(200),
                    //           letterSpacing: 0.3,
                    //           fontWeight: FontWeight.w700)),
                    //     )),
                    listTile(
                        themeData: themeData,
                        leading: Icon(MdiIcons.storeRemoveOutline,
                            //diIcons.full,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(220)),
                        text: "انهاء",
                        context: context,
                        key: key,
                        onTap: () {
                          ErrorResponse.awesomeDialog(
                            error: '${issue.name} هل انت متاكد من انهاء تهمة ',
                            context: context,
                            dialogType: DialogType.ERROR,
                            color: Colors.red,
                            btnCancel: 'الغاء',
                            btnOkOnPress: () {
                              setState(() {
                                context
                                    .read<IssueProvder>()
                                    .markTaskCompleted(issue.id!);
                              });
                              key == 0
                                  ? Navigator.pop(context)
                                  : Navigator.push(context,
                                      CostumNvigator(const MyNavigationBar()));
                            },
                            btnCancelOnPress: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                        setState: setState,
                        sizeText: 20),
                    listTile(
                        themeData: themeData,
                        leading: Icon(MdiIcons.deleteOutline,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(220)),
                        text: "حذف",
                        context: context,
                        key: key,
                        onTap: () {
                          // return AwesomeDialog(
                          //   context: context,
                          //   dialogType: DialogType.QUESTION,
                          //   animType: AnimType.RIGHSLIDE,
                          //   headerAnimationLoop: false,
                          //   title: " حذف : (${issue.name!.split(' ')[0]})",
                          //   desc:
                          //       '   سيتم حذف  (${issue.name!}) نهائياً هل انت متاكد من ذالك  ',
                          //   btnOkOnPress: () {},
                          //   // allEreaApi
                          //   //     .deleteAllcaverage(
                          //   //         allcaverageerea);

                          //   btnOkText: 'موافق',
                          //   btnCancelText: 'الغاء',
                          //   btnCancelOnPress: () {},
                          //   btnOkColor: Colors.red,
                          // )..show();
                          return ErrorResponse.awesomeDialog(
                              error: " حذف : (${issue.name!.split(' ')[0]})",
                              describtion:
                                  'سيتم حذف  ${issue.name}نهائياً هل انت متاكد من ذالك',

                              // '   سيتم حذف  (${issue.name!})n\ نهائياً هل انت متاكد من ذالك  ',
                              context: context,
                              dialogType: DialogType.WARNING,
                              color: Colors.red,
                              btnCancel: 'الغاء',
                              btnCancelOnPress: () {
                                Navigator.pop(context);
                              },
                              btnOkOnPress: () {
                                setState(() {
                                  context.read<IssueProvder>().delete(issue);
                                });

                                key == 0
                                    ? Navigator.pop(context)
                                    : Navigator.push(context,
                                        CostumNvigator(const MyNavigationBar()));
                              });
                        },
                        setState: setState,
                        sizeText: 20),
                    // ListTile(
                    //   dense: true,
                    //   leading: Icon(MdiIcons.deleteOutline,
                    //       color: themeData.colorScheme.onBackground
                    //           .withAlpha(220)),
                    //   title: Text(
                    //     "حذف",
                    //     style: themeData.textTheme.bodyText1!.merge(TextStyle(
                    //         color: themeData.colorScheme.onBackground,
                    //         letterSpacing: 0.3,
                    //         fontWeight: FontWeight.w500)),
                    //   ),
                    //   onTap: () {
                    //     setState(() {
                    //       context.read<IssueProvder>().delete(issue);
                    //     });

                    //     key == 0
                    //         ? Navigator.pop(context)
                    //         : Navigator.push(
                    //             context, CostumNvigator(const NavigationBar()));
                    //   },
                    // ),

                    // Divider(
                    //   color: themeData.dividerColor,
                    // ),
                    listTile(
                        themeData: themeData,
                        leading: Icon(MdiIcons.downloadOutline,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(220)),
                        text: "تنزيل",
                        context: context,
                        key: key,
                        onTap: () {},
                        setState: setState,
                        sizeText: 20),

                    listTile(
                        themeData: themeData,
                        leading: Icon(MdiIcons.shareOutline,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(220)),
                        text: "مشاركة",
                        context: context,
                        key: key,
                        onTap: () {},
                        setState: setState,
                        sizeText: 20),
                    // ListTile(
                    //   dense: true,
                    //   leading: Icon(MdiIcons.downloadBoxOutline,
                    //       color: themeData.colorScheme.onBackground
                    //           .withAlpha(220)),
                    //   title: Text(
                    //     "تنزيل",
                    //     style: themeData.textTheme.bodyText1!.merge(TextStyle(
                    //         color: themeData.colorScheme.onBackground,
                    //         letterSpacing: 0.3,
                    //         fontWeight: FontWeight.w500)),
                    //   ),
                    //   onTap: () {},
                    // ),

                    // ListTile(
                    //   dense: true,
                    //   leading: Icon(MdiIcons.shareOutline,
                    //       color: themeData.colorScheme.onBackground
                    //           .withAlpha(220)),
                    //   title: Text(
                    //     "مشاركة",
                    //     style: themeData.textTheme.bodyText1!.merge(TextStyle(
                    //         color: themeData.colorScheme.onBackground,
                    //         letterSpacing: 0.3,
                    //         fontWeight: FontWeight.w500)),
                    //   ),
                    // ),
                    // ListTile(
                    //   dense: true,
                    //   leading: Icon(MdiIcons.cloudUploadOutline,
                    //       color: themeData.colorScheme.onBackground
                    //           .withAlpha(220)),
                    //   title: Text(
                    //     "Upload photo",
                    //     style: themeData.textTheme.bodyText1!.merge(TextStyle(
                    //         color: themeData.colorScheme.onBackground,
                    //         letterSpacing: 0.3,
                    //         fontWeight: FontWeight.w500)),
                    //   ),
                    // ),
                    // ListTile(
                    //   dense: true,
                    //   leading: Icon(MdiIcons.cameraOutline,
                    //       color: themeData.colorScheme.onBackground
                    //           .withAlpha(220)),
                    //   title: Text(
                    //     "Take Photo",
                    //     style: themeData.textTheme.bodyText1!.merge(TextStyle(
                    //         color: themeData.colorScheme.onBackground,
                    //         letterSpacing: 0.3,
                    //         fontWeight: FontWeight.w500)),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static Widget listTile(
      {required themeData,
      required Widget leading,
      required String text,
      required BuildContext context,
      required int key,
      required Function() onTap,
      required void Function(void Function() fn) setState,
      required double sizeText}) {
    return ListTile(
        dense: true,
        //markerCancel
        //storeRemove
        //archiveArrowDownOutline
        //sortVariantRemove
        leading: leading,
        //  Icon(MdiIcons.storeRemoveOutline,
        //     //diIcons.full,
        // color: themeData.colorScheme.onBackground
        // .withAlpha(220)
        // ),
        title: Text(
          text,
          // "انهاء",
          style: themeData.textTheme.bodyText1!.merge(TextStyle(
              color: themeData.colorScheme.onBackground,
              letterSpacing: 0.3,
              fontSize: sizeText,
              fontWeight: FontWeight.w500)),
        ),
        onTap: onTap
        // setState(() {
        //   context.read<IssueProvder>().markTaskCompleted(issue.id!);
        // });
        // key == 0
        //     ? Navigator.pop(context)
        //     : Navigator.push(context, CostumNvigator(const NavigationBar()));

        );
  }

  static customShowBottomSheet(
      {required final Issue issue,
      // required final IssueProvder taskController,
      required BuildContext context,
      required int key,
      required void Function(void Function() fn) setState}) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            padding: EdgeInsets.only(top: MySize.size4!),
            height: issue.isCompleted == 1
                ? context.height * 0.24
                : context.height * 0.32,
            color: Get.isDarkMode ? darkGreyClr : Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MySize.size10,
                    width: MySize.size120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MySize.size10!),
                      color:
                          Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
                    ),
                  ),
                  20.height,
                  issue.isCompleted == 1
                      ? 0.height
                      : _bottomSheetButton(
                          label: 'انهاء المهمة',
                          onTap: () {
                            setState(() {
                              context
                                  .read<IssueProvder>()
                                  .markTaskCompleted(issue.id!);
                            });
                            key == 0
                                ? Navigator.pop(context)
                                : Navigator.push(context,
                                    CostumNvigator(const MyNavigationBar()));
                          },
                          clr: primaryClr,
                          context: context,
                        ),
                  20.height,
                  _bottomSheetButton(
                    label: 'حذف المهمة',
                    onTap: () {
                      setState(() {
                        context.read<IssueProvder>().delete(issue);
                      });

                      key == 0
                          ? Navigator.pop(context)
                          : Navigator.push(
                              context, CostumNvigator(const MyNavigationBar()));
                    },
                    clr: Colors.red[300]!,
                    context: context,
                  ),
                  20.height,
                  _bottomSheetButton(
                      label: 'أغلاق',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      clr: Colors.red[300]!,
                      context: context,
                      isClose: true),
                  10.height,
                ],
              ),
            ),
          );
        });
  }

  static _bottomSheetButton({
    required String label,
    required Function() onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: isClose == true
              ? Get.isDarkMode
                  ? Colors.grey[600]!
                  : Colors.grey[300]!
              : clr,
          border: Border.all(
            width: 2,
            color: isClose == true ? Colors.transparent : clr,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          label,
          style:
              isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
        )),
      ),
    );
  }
}
