import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/utils/AppColors.dart';
import 'package:flutterapp/utils/AppTextStyles.dart';

import 'PlatformWidget.dart';

class PlatformAlertDialog extends PlatformWidget {
  PlatformAlertDialog({
    @required this.title,
    @required this.content,
    this.cancelText,
    this.submitText,
    this.voidCallback,
  })  : assert(title != null),
        assert(content != null);

  final String title;
  final String content;
  final String cancelText;
  final String submitText;
  final VoidCallback voidCallback;

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title,
          style: AppTextStyles.appTextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: AppColors.fontColor)),
      content: Text(content,
          style: AppTextStyles.appTextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: AppColors.fontColor)),
      actions: _actions(context, cancelText?.toUpperCase(),
          submitText?.toUpperCase(), voidCallback),
    );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title,
          style: AppTextStyles.appTextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: AppColors.fontColor)),
      content: Text(content,
          style: AppTextStyles.appTextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: AppColors.fontColor)),
      actions: _actions(context, cancelText, submitText, voidCallback),
    );
  }

  List<Widget> _actions(BuildContext context, String cancelText,
      String submitText, VoidCallback voidCallback) {
    var actions = <Widget>[];
    if (cancelText != null) {
      actions.add(PlatformAlertDialogAction(
        child: Text(
          cancelText,
          style: AppTextStyles.appTextStyle(
              color: AppColors.fontColor,
              fontSize: 14,
              fontWeight: FontWeight.normal),
        ),
        onPressed: () => _dismiss(context, false),
      ));
    }
    if (submitText != null) {
      actions.add(PlatformAlertDialogAction(
        child: Text(
          submitText,
          style: AppTextStyles.appTextStyle(
              color: AppColors.fontColor,
              fontSize: 14,
              fontWeight: FontWeight.normal),
        ),
        onPressed: () => voidCallback.call(),
      ));
    }
    return actions;
  }

  Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: !Platform.isIOS,
      builder: (context) => this,
    );
    // showDialog returns null if the dialog has been dismissed with the back
    // button on Android.
    // here we ensure that we return only true or false
    return Future.value(result ?? false);
  }

  void _dismiss(BuildContext context, bool value) {
    Navigator.of(context, rootNavigator: true).pop(value);
  }
}

class PlatformAlertDialogAction extends PlatformWidget {
  PlatformAlertDialogAction({this.child, this.onPressed});

  final Widget child;
  final VoidCallback onPressed;

  @override
  FlatButton buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  CupertinoDialogAction buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }
}
