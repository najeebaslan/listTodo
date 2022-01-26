import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:local_notifaiction/ui/widgets/style.dart';
import 'package:local_notifaiction/utils/utils_functions.dart';

import 'issue_detials_screen.dart';

class NotifidePage extends StatelessWidget {
  final String? lable;
  const NotifidePage({
    Key? key,
    required this.lable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = lable.toString().split("|")[2].toString();
    String note = lable.toString().split("|")[3].toString();

    /* this is enter user */

    String enter = UtilsFunctions.datas(UtilsFunctions.replisDate(lable, 0), 0);

    /* this is first  week */
    // String week = ;
    String week =
        UtilsFunctions.datas(UtilsFunctions.replisDate(lable, 168), 0);
    /* this is first 45 day */

    String first45 =
        UtilsFunctions.datas(UtilsFunctions.replisDate(lable, 1224), 0);
    /* htis is netx 45 day  */
    String next45 =
        UtilsFunctions.datas(UtilsFunctions.replisDate(lable, 2304), 0);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          // backgroundColor: context.theme.backgroundColor,
          // Get.isDarkMode ? Colors.grey[600] : Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black
                // Get.isDarkMode ? Colors.white : Colors.grey,
                ),
          ),
          title: Text(
            name,
            style: const TextStyle(
                color: Colors.black, fontFamily: StyleWidget.fontName),
          ),
        ),
        body:Container(
            height: 400,
            width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primaryClr,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    columnData(
                      name,
                      ' الاسم :  ',
                    ),
                    columnData(
                      enter,
                      'تاريخ الدخول :  ',
                    ),
                    columnData(
                      week,
                      'تاريخ  التنبية الاول :  ',
                    ),
                    columnData(
                      first45,
                      'تاريخ  التنبية الثاني :  ',
                    ),
                    columnData(
                      next45,
                      'تاريخ  التنبية الثالث :  ',
                    ),
                    note.toString().length < 20
                        ? Row(
                            children: [
                            Text(
                                  'الملاحظة:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: StyleWidget.fontName,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    letterSpacing: -0.2,
                                    color: StyleWidget.white,
                                  ),
                                ).paddingOnly(top: 5, right: 10, left: 0),
                              
                               Text(
                                  note,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: StyleWidget.fontName,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    letterSpacing: -0.2,
                                    color: StyleWidget.white,
                                  ),
                                
                              ).paddingOnly(
                                    top: 5, right: 10, left: 0)
                            ],
                          )
                        : Column(
                              children: [
                                DescriptionTextWidget(
                                  text: note,
                                  color: StyleWidget.white70,
                                  colorshow: Colors.white,
                                  colorTitle: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 19,
                                ),
                              ],
                            ).paddingOnly(right: 18),
                  ],
                ),
              ),
            ),
        
        ).paddingOnly(top: 20, right: 20, left: 20),
      ),
    );
  }

  columnData(data, text) {
    return Column(
        children: <Widget>[
    Row(
              children: <Widget>[
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: StyleWidget.fontName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    overflow: TextOverflow.clip,
                    letterSpacing: -0.1,
                    color: StyleWidget.white,
                  ),
                ),
                Text(
                  data,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: StyleWidget.fontName,
                    fontSize: 19,
                    overflow: TextOverflow.ellipsis,
                    letterSpacing: -0.2,
                    color: StyleWidget.white70,
                  ),
                ),
              ],
            ),
         
        ],
     
    ).paddingAll(8);
  }
}
