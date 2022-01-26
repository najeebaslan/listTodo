import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

/* Colors public */
const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color withe = Colors.white;
const Color primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = const Color(0xFF424242);
const Color deepOrange = Colors.deepOrange;

class UtilsFunctions {
  static differintTime(String? date, number) {
    /*  هذا لعرض متى انتهاء الاشعار او اشعارات المتهم كلهم */
    final startTime =
        DateTime.parse(date!.toString()).add(Duration(hours: number));
    DateTime onlyDate = DateTime(
      startTime.year,
      startTime.month,
      startTime.day,
      7, //this is time = 07:00 AM
    );
    //this is Decrease the date of entry of the accused from our current date
    var result = Jiffy(onlyDate).yMMMMEEEEdjm;
    var year = result.toString().split(' ')[3].toString();
    var month = result.toString().split(' ')[1].toString();
    var day = result.toString().split(' ')[2].toString();
    var time = result.toString().split(' ,')[0].toString().split(year)[1];
    var nameDay = result.toString().split(',')[0].toString();
    // print(
    // '$year|${monthTranslistion(month)}|${day.toString().split(',')[0]}|${daysTranslistion(nameDay.toString())}|${periodTime(time.split(' ')[1].toString())}');
    return '$year|${monthTranslistion(month)}|${day.toString().split(',')[0]}|${daysTranslistion(nameDay.toString())}|${periodTime(time.split(' ')[1].toString() + '|' + time.split(' ')[2].toString())}';
  }

  /* this is replis data will have | */
  static replisDate(lable, int number) {
    return UtilsFunctions.differintTime(
        lable.toString().split("|")[1].toString(), number);
  }

  /* this is replis data will not have | */
  static replisDate1(lable, int number) {
    return UtilsFunctions.differintTime(lable.toString(), number);
  }

  static datas(date, int key) {
    if (key == 0) {
      return date.toString().split('|')[0].toString() +
          " ," +
          date.toString().split('|')[3].toString() +
          " ," +
          date.toString().split('|')[2].toString() +
          " " +
          date.toString().split('|')[1].toString();
    } else {
     var tme=  date.toString().split('|')[4].toString().split(':')[0].toString();
      return date.toString().split('|')[0].toString() +
          " ," +
          date.toString().split('|')[3].toString() +
          " ," +
          date.toString().split('|')[2].toString() +
          " " +
          date.toString().split('|')[1].toString() +
          " " +tme+date.toString().split('|')[4].toString().split('00')[1]
         ;
    }
  }

/* this is for transition Months */
  static monthTranslistion(month) {
    if (month == 'January') {
      return month = 'يناير';
    }
    if (month == 'February') {
      return month = 'فبراير';
    }
    if (month == 'March') {
      return month = 'مارس';
    }
    if (month == 'April') {
      return month = 'أبريل';
    }
    if (month == 'May') {
      return month = 'مايو';
    }
    if (month == 'June') {
      return month = 'يونيو';
    }
    if (month == 'July') {
      return month = 'يوليو';
    }
    if (month == 'August') {
      return month = 'أغسطس';
    }
    if (month == 'September') {
      return month = 'سبتمبر';
    }
    if (month == 'October') {
      return month = 'أكتوبر';
    }
    if (month == 'November') {
      return month = 'نوفمبر';
    }
    if (month == 'December') {
      return month = 'ديسمبر';
    }
  }

/* this is for transition Days */
  static daysTranslistion(day) {
    if (day == 'Saturday') {
      return day = 'السبت';
    }
    if (day == 'Friday') {
      return day = 'الجمعة';
    }
    if (day == 'Thursday') {
      return day = 'الخميس';
    }
    if (day == 'Wednesday') {
      return day = 'الأربعاء';
    }
    if (day == 'Tuesday') {
      return day = 'الثلاثاء';
    }
    if (day == 'Monday') {
      return day = 'الإثنين';
    }
    if (day == 'Sunday') {
      return day = 'الأحَد';
    }
  }

  static periodTime(String? period) {
    period!.split('|').toString();

    if (period.split('|')[1] == 'AM') {
      return period.split('|')[0].toString() + ' ص';
    } else if (period.split('|')[1].toString() == 'PM') {
      return period.split('|')[0].toString() + ' م';
    }
  }

  /* this is split eny date */
  static spliteDate(date) {
    return date.toString().split(' ')[0].toString();
  }

  /* this is for Remaining days until the end of the alert */
  static remainingDays(
    date,
    alarm,
  ) {
    String? result;
/* This is to compare the (week or first 45 day or next 45 day) after the date of his entry to the date of his entry, and to obtain the remaining days for a (week or first 45 day or next 45 day) after his entry */
    final dateAftreWeek =
        DateTime.parse(date!.toString()).add(Duration(hours: alarm));
    var dates = DateTime.now();
    DateTime onlyDate = DateTime(
      dates.year,
      dates.month,
      dates.day,
      // 7
    );

    final diff_Dy = onlyDate.difference(dateAftreWeek).inDays;
    final diff_Hr = onlyDate.difference(dateAftreWeek).inHours;
    final diff_Mi1 = onlyDate.difference(dateAftreWeek).inMinutes;
    if (diff_Dy.toString().startsWith('-')) {
      if (diff_Dy != 0) {
        return result = '${diff_Dy.toString().split('-')[1]}|  يوم';
      } else if (diff_Dy == 0) {
        if (diff_Hr != 0) {
          return result =
              '${diff_Hr.toString().toString().split('-')[1]}| ساعة';
        } else if (diff_Mi1 != 0) {
          return result =
              ' ${diff_Mi1.toString().toString().split('-')[1]}| دقيقة';
        } else {
          return result = 'المدة مكتملة لم يتبقي اي وقت |0';
        }
      }
    } else {
      return result = 'المدة مكتملة لم يتبقي اي وقت |0';
    }
  }

  /* this  is for get animation week */

  static animiatiopnWeek(height, double key) {
    if (height == 0) {
      return height = key == 0 ? 70.3333333333 : 40.6666666667;
    }
    if (height == 1) {
      return height = key == 0 ? 36 + 27.0 : 36.6666666667;
    }
    if (height == 2) {
      return height = key == 0 ? 32 + 24.0 : 32.6666666667;
    }
    if (height == 3) {
      return height = key == 0 ? 24 + 18.0 : 24.6666666667;
    }
    if (height == 4) {
      return height = key == 0 ? 18 + 13.5 : 18.6666666667;
    }
    if (height == 5) {
      return height = key == 0 ? 12 + 8.5 : 12.6666666667;
    }
    if (height == 6) {
      return height = key == 0 ? 6 + 10.5 : 1.6666666667;
    }
  }

  /* this is for the get animation first 45 day */

  static animiatiopnFirst45Day(height, double key) {
    if (height == 0) {
      return height = key == 0 ? 70.0 : 40.6666666667;
    }
    if (height <= 1) {
      return height = 37.6666666667;
    }
    if (height <= 3) {
      return height = key == 0 ? 48.0 : 36.6666666667;
    }
    if (height <= 5) {
      return height = key == 0 ? 49.0 : 35.6666666667;
    }
    if (height <= 10) {
      return height = key == 0 ? 44.0 : 33.5;
    }
    if (height <= 20) {
      return height = key == 0 ? 37.0 : 28.6666666667;
    }
    if (height <= 25) {
      return height = key == 0 ? 33.0 : 25.1666666667;
    }
    if (height <= 30) {
      return height = key == 0 ? 24.0 : 18.1666666667;
    }
    if (height <= 40) {
      return height = key == 0 ? 10.0 : 8.1666666667;
    }
    if (height <= 51) {
      return height = key == 0 ? 0.26666666667 : 0.20;
    }
  }

/* this is for the get animation next 45 day */
  static animiatiopnNext45Day(height, double key) {
    // height = 0;
    if (height <= 0) {
      return height = key == 0 ? 70.0 : 40.0;
    }

    if (height <= 1) {
      return height = key == 0 ? 66.5 : 37.0;
    }
    if (height <= 2) {
      return height = key == 0 ? 62.0 : 36.0;
    }
    if (height <= 4) {
      return height = key == 0 ? 60.5 : 36.0;
    }
    if (height <= 6) {
      return height = key == 0 ? 56.0 : 35.5;
    }
    if (height <= 8) {
      return height = key == 0 ? 55.5 : 35.0;
    }

    if (height <= 10) {
      //Najeeb 60
      return height = key == 0 ? 54.0 : 34.5;
    }

    if (height <= 12) {
      return height = key == 0 ? 53.5 : 34.0;
    }

    if (height <= 14) {
      return height = key == 0 ? 53.0 : 33.5;
    }

    if (height <= 16) {
      return height = key == 0 ? 52.5 : 33.0;
    }

    if (height <= 18) {
      return height = key == 0 ? 52.0 : 32.5;
    }

    if (height <= 20) {
      return height = key == 0 ? 51.5 : 32.0;
    }

    if (height <= 22) {
      return height = key == 0 ? 51.0 : 31.5;
    }

    if (height <= 24) {
      return height = key == 0 ? 50.5 : 31.5;
    }

    if (height <= 26) {
      return height = key == 0 ? 58.0 : 30.0;
    }

    if (height <= 28) {
      return height = key == 0 ? 57.5 : 30.5;
    }

    if (height <= 30) {
      return height = key == 0 ? 57.0 : 29.0;
    }

    if (height <= 32) {
      return height = key == 0 ? 56.5 : 29.5;
    }

    if (height <= 34) {
      return height = key == 0 ? 56.0 : 28.0;
    }

    if (height <= 36) {
      return height = key == 0 ? 55.6 : 28.5;
    }

    if (height <= 38) {
      return height = key == 0 ? 55.0 : 27.0;
    }

    if (height <= 40) {
      return height = key == 0 ? 54.5 : 27.5;
    }

    if (height <= 42) {
      return height = key == 0 ? 55.0 : 26.0;
    }

    if (height <= 44) {
      return height = key == 0 ? 54.0 : 26.5;
    }

    if (height <= 46) {
      return height = key == 0 ? 52.5 : 25.0;
    }

    if (height <= 48) {
      return height = key == 0 ? 50.5 : 25.0;
    }

    if (height <= 50) {
      return height = key == 0 ? 48.0 : 24.0;
    }

    if (height <= 52) {
      return height = key == 0 ? 46.5 : 24.0;
    }

    if (height <= 54) {
      return height = key == 0 ? 44.0 : 23.5;
    }

    if (height <= 56) {
      return height = key == 0 ? 42.5 : 23.0;
    }

    if (height <= 58) {
      return height = key == 0 ? 40.0 : 22.0;
    }

    if (height <= 60) {
      return height = key == 0 ? 38.5 : 22.0;
    }

    if (height <= 62) {
      return height = key == 0 ? 36.0 : 21.5;
    }

    if (height <= 64) {
      return height = key == 0 ? 34.5 : 21.5;
    }

    if (height <= 66) {
      return height = key == 0 ? 32.0 : 20.0;
    }

    if (height <= 68) {
      return height = key == 0 ? 30.5 : 19.0;
    }

    if (height <= 70) {
      return height = key == 0 ? 28.0 : 19.5;
    }

    if (height <= 72) {
      return height = key == 0 ? 26.5 : 19.0;
    }

    if (height <= 74) {
      return height = key == 0 ? 24.5 : 18.0;
    }

    if (height <= 76) {
      return height = key == 0 ? 22.5 : 18.0;
    }

    if (height <= 78) {
      return height = key == 0 ? 20.0 : 17.0;
    }

    if (height <= 80) {
      return height = key == 0 ? 18.5 : 17.0;
    }

    if (height <= 82) {
      return height = key == 0 ? 16.5 : 16.5;
    }

    if (height <= 84) {
      return height = key == 0 ? 14.5 : 15;
    }

    if (height <= 86) {
      return height = key == 0 ? 12.5 : 14.5;
    }

    if (height <= 88) {
      return height = key == 0 ? 10.5 : 13.0;
    }

    if (height <= 90) {
      return height = key == 0 ? 8.4 : 12.0;
    }

    if (height <= 92) {
      return height = key == 0 ? 6.4 : 10.0;
    }

    if (height <= 94) {
      return height = key == 0 ? 4.4 : 5.0;
    }

    if (height <= 96) {
      return height = key == 0 ? 0.4 : 0.0;
    }
  }
}
