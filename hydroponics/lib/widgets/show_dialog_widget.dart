import 'package:flutter/material.dart';

class ShowDialog {
  Future<void> showMyDialog(String messageTitle, String messageText,
      String buttonText, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(messageTitle),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(messageText),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
