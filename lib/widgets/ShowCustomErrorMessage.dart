import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/utils/AppTextStyles.dart';

class ShowCustomErrorMessage extends StatefulWidget {
  final CancelFunc cancelFunc;
  final String message;

  const ShowCustomErrorMessage({Key key, this.cancelFunc, this.message})
      : super(key: key);

  @override
  _ShowCustomErrorMessageState createState() => _ShowCustomErrorMessageState();
}

class _ShowCustomErrorMessageState extends State<ShowCustomErrorMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: _showCustomErrorMessage());
  }

  Widget _showCustomErrorMessage() {
    return Card(
      color: Colors.black87,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: new Text(
                  widget.message,
                  style: AppTextStyles.appTextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
