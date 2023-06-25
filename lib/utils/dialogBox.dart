import 'package:flutter/material.dart';

class DialogBox {
  ///Dialog Box For Overview Field In Api
  alertDialog(String overView, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Overview'),
          actions: [
            InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: const Text(
                'Back',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
          ],
          elevation: 2,
          content: Text(overView),
          titlePadding: const EdgeInsets.all(12),
        );
      },
    );
  }
}
