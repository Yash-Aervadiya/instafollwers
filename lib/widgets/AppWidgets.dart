import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/platfrom-widgets/PlatformAlertDialog.dart';
import 'package:flutterapp/utils/AppColors.dart';
import 'package:flutterapp/utils/AppTextStyles.dart';
import 'package:flutterapp/widgets/ShowCustomErrorMessage.dart';

class AppWidgets {
  static Future dialogLoadingBar(BuildContext context, {String message}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[message != null ? new Text(message) : Container()],
        );
      },
    );
  }

  static Future dismissDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future dismissDialogWithRootNavigator(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static void showErrorMessage(String message, {Alignment alignment}) {
    BotToast.showCustomNotification(
      animationDuration: Duration(milliseconds: 440),
      align: alignment ?? Alignment(0, 0.8),
      toastBuilder: (cancel) {
        return ShowCustomErrorMessage(
          cancelFunc: cancel,
          message: message,
        );
      },
      enableSlideOff: true,
    );
  }

  static Future showErrorDialog(BuildContext context, String error,
      {String title}) {
    PlatformAlertDialog(
      title: title ?? 'Successs',
      content: error,
      cancelText: 'Dismiss',
    ).show(context);
  }

  static Future emptyErrorDialog(BuildContext context, String error,
      {String title}) {
    PlatformAlertDialog(
      title: title ?? "Field can't be empty",
      content: "$error can't be empty",
      cancelText: 'Dismiss',
    ).show(context);
  }

  static Future popScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Widget spacingWidget(double height) {
    return SizedBox(height: height);
  }

  static Widget somethingWrong({String title}) {
    return Center(child: new Text(title ?? "Something went wrong"));
  }

  static Widget appButton(
      {BuildContext context, VoidCallback voidCallback, String title}) {
    return Container(
      decoration: new BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.green.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 0,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]),
      width: MediaQuery.of(context).size.width * 0.9,
      child: new RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.all(12),
          onPressed: () => voidCallback.call(),
          color: Colors.green,
          child: new Text(
            title,
            style: AppTextStyles.appTextStyle(
                fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
          )),
    );
  }

  static Widget appAppbar(String title, {double fSize, Color fColor}) {
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.only(start: 10),
      border: null,
      backgroundColor: Colors.white,
      middle: new Text(
        title,
        style: AppTextStyles.appTextStyle(
            color: fColor ?? Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: fSize ?? 17),
      ),
    );
  }

  static Widget appAppbarWithLeading(String title,
      {double fSize, Color fColor}) {
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.only(start: 10),
      border: null,
      backgroundColor: Colors.white,
      leading: Container(),
      middle: new Text(
        title,
        style: AppTextStyles.appTextStyle(
            color: fColor ?? Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: fSize ?? 17),
      ),
    );
  }

  static Widget appAppbarWithAction(
      String title, String trailing, Function voidCallback,
      {double fSize, Color fColor, GlobalKey editKey}) {
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.only(start: 10),
      border: null,
      backgroundColor: Colors.white,
      middle: new Text(
        title,
        style: AppTextStyles.appTextStyle(
            color: fColor ?? Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: fSize ?? 17),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: GestureDetector(
          onTap: () => voidCallback.call(),
          child: new Text(
            trailing,
            key: editKey ?? null,
            style: AppTextStyles.appTextStyle(
                color: AppColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  static Widget appAppbarWithActionWidget(
      String title, String trailing, Widget action,
      {double fSize, Color fColor}) {
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.only(start: 10),
      border: null,
      backgroundColor: Colors.white,
      middle: new Text(
        title,
        style: AppTextStyles.appTextStyle(
            color: fColor ?? Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: fSize ?? 17),
      ),
      trailing:
          Padding(padding: const EdgeInsets.only(right: 10), child: action),
    );
  }

  static Widget appAppbarWithActionAndLeadingWidget(
      String title, String trailing, Widget action,
      {double fSize, Color fColor}) {
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.only(start: 10),
      border: null,
      leading: new Container(),
      backgroundColor: Colors.white,
      middle: new Text(
        title,
        style: AppTextStyles.appTextStyle(
            color: fColor ?? Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: fSize ?? 17),
      ),
      trailing:
          Padding(padding: const EdgeInsets.only(right: 15), child: action),
    );
  }
}
