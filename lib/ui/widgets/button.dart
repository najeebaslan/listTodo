import 'package:flutter/material.dart';

import 'package:flutx/themes/app_theme.dart';
import 'package:local_notifaiction/ui/widgets/style.dart';

/* --------------------------------------Thid ===   Monday, November 29, 2021 6:09 AM
 
 DateTime picked = DateTime.now(); // just a random datetime
    final formattedDate = Jiffy(picked).yMMMMEEEEdjm;
     print(formattedDate); */

/* ---------------------------------------------------------- */

//Jiffy().jm ==================>6:15 AM

//------------------------------------------------------------------

//Jiffy().MMMM  ============>November

//------------------------------------------------------------------

//Jiffy().MEd ==============>Mon, 11/29

//------------------------------------------------------------------

//var date2 = DateFormat( 'y/MM/dd, hh:mm a',).format(DateTime.now());======>2021/11/29, 06:48 AM

//------------------------------------------------------------------

//var date2 = DateFormat( 'y/MM/dd, hh:mm a', ).format(DateTime(2021,15,12,06,21));====>2022/03/12, 06:21 AM

/*
    DateTime picked = DateTime.now(); // just a random datetime
    final formattedDate = Jiffy(picked); // Mar 21, 2021
    var parsedDate = Jiffy(formattedDate, "MMM do yyyy, h:mm:ss a").dateTime; // 2021-03-21 00:00:00.000
    parsedDate.add(Duration(days: 3));
    print(parsedDate.add(Duration(days: 3)).toString() + 'للللللللللللللللللللللل'); */

import 'package:local_notifaiction/utils/utils_functions.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: primaryClr),
        child: Center(
          child: Text(label,
              style: TextStyle(
                  color: FxAppTheme.customTheme.bgLayer2,
                  fontFamily: StyleWidget.fontName,
                  fontSize: 16,fontWeight: FontWeight.w700
                  // fontSize: 19
                  )),
        ),
      ),
    );
  }
}
//1.5/45