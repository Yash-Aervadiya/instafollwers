import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/utils/AppColors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle appTextStyle(
      {double fontSize, FontWeight fontWeight, Color color}) {
    return GoogleFonts.sourceSansPro(
        fontSize: fontSize ?? 16,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w300,
        color: color ?? AppColors.fontColor);
  }

  static InputDecoration textFiledDecoration(String hint) {
    return InputDecoration(
      focusedBorder: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          ),
          borderSide: BorderSide(color: Colors.grey, width: 0.5)),
      hintText: hint,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300], width: 1.0),
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          )),
      filled: false,
      contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 7),
      fillColor: Colors.grey,
    );
  }

  static InputDecoration textFiledDecorationWithSuffix(String hint) {
    return InputDecoration(
        focusedBorder: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: BorderSide(color: Colors.grey, width: 1.0)),
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300], width: 1.0),
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            )),
        filled: false,
        contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 7),
        fillColor: Colors.grey,
        suffixIcon: new Icon(Icons.arrow_forward_ios));
  }

  static InputDecoration textFiledWithBorderAndSuffix(
      String hint, IconData iconData) {
    return InputDecoration(
        focusedBorder: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: BorderSide(
                color: AppColors.primaryColor.withOpacity(0.8), width: 1.0)),
        hintText: hint,
        errorStyle: AppTextStyles.appTextStyle(
            fontSize: 10,
            color: Colors.red[700],
            fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.primaryColor.withOpacity(0.8), width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.primaryColor.withOpacity(0.8), width: 1.0),
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            )),
        filled: false,
        contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 7),
        fillColor: AppColors.primaryColor.withOpacity(0.8),
        suffixIcon: new Icon(
          iconData,
          color: AppColors.primaryColor,
        ));
  }

  static InputDecoration textFiledWithBorder(String hint, {String suffixText}) {
    return InputDecoration(
        focusedBorder: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: BorderSide(
                color: AppColors.primaryColor.withOpacity(0.8), width: 1.0)),
        hintText: hint,
        errorStyle: AppTextStyles.appTextStyle(
            fontSize: 10,
            color: Colors.red[700],
            fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.primaryColor.withOpacity(0.8), width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.primaryColor.withOpacity(0.8), width: 1.0),
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            )),
        filled: false,
        suffixText: suffixText ?? '',
        suffixStyle: textBoxTextStyles(),
        contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 7),
        fillColor: AppColors.primaryColor.withOpacity(0.8));
  }

  static TextStyle textBoxTextStyles() {
    return AppTextStyles.appTextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.primaryColor.withOpacity(0.8));
  }
}
