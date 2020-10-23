import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppMethods {
  static String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email can \'t be empty';
    } else {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value.trim()))
        return 'Enter valid email';
      else
        return null;
    }
  }

  static String validate(String value, String filed) {
    if (value.isEmpty) {
      return '$filed can \'t be empty';
    }
    return null;
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password can \'t be empty';
    } else {
      if (value.length <= 5) {
        return 'Password must be 6 or more character';
      }
    }
    return null;
  }

  static DateTime convertStringToDate(String strDate) {
    DateTime convertDate = DateFormat('dd-MM-yyyy').parse(strDate);
    return convertDate;
  }

  static String convertDateToString(DateTime strDate) {
    var dateFormat = DateFormat('dd-MM-yyyy');
    return dateFormat.format(strDate);
  }

  static DateTime increaseDay(DateTime strDate, int daynumber) {
    DateTime newDate =
        new DateTime(strDate.year, strDate.month, strDate.day + daynumber);
    return newDate;
  }

  static DateTime nextWeekDay(DateTime strDate) {
    DateTime tempDate = strDate;
    //if monday  is gone then find next week monday
    int remainWeekday = 7 - (tempDate.weekday);

    DateTime newEndDate = new DateTime(
        tempDate.year, tempDate.month, tempDate.day + (remainWeekday + 1));
    tempDate = newEndDate;

    return tempDate;
  }

  static DateTime getEndDate(
      String timeFrameCount, String timeFrameDate, DateTime startDate) {
    if (timeFrameCount == '0') {
      return DateFormat('dd-MM-yyyy').parse(timeFrameDate);
    }
    int days = int.tryParse(timeFrameCount) * 30;
    return AppMethods.increaseDay(startDate, days);
  }

  static String getNumberSequenceFromString(String item) {
    List<String> frequencyList = item.split(' ');
    frequencyList.removeWhere((element) => !isNumber(element));

    return frequencyList.length != 0
        ? getFrequencyCount(frequencyList[0])
        : '0';
  }

  static bool isNumber(String item) {
    return '0123456789'.split('').contains(item);
  }

  static String getFrequencyCount(String fCount) {
    if (fCount == '1') {
      return '1';
    } else if (fCount == '2') {
      return '1,2';
    } else if (fCount == '3') {
      return '1,2,3';
    } else if (fCount == '4') {
      return '1,2,3,4';
    } else if (fCount == '5') {
      return '1,2,3,4,5';
    } else if (fCount == '6') {
      return '1,2,3,4,5,6';
    } else {
      return '1,2,3,4,5,6,7';
    }
  }

  static Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }

  static void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
