import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PlatformWidget.dart';

@deprecated
class PlatformSwitch extends PlatformWidget {
  PlatformSwitch({Key key, this.value, this.onChanged}) : super(key: key);
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoSwitch(value: value, onChanged: onChanged);
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return Switch(value: value, onChanged: onChanged);
  }
}