import 'package:flutter/material.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';

Future<dynamic> titleContentOneButtonDialog({
  required BuildContext context,
  required String content,
  required String buttonText,
}) =>
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: ((context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          children: [
            SizedBox(
              width: 320,
              child: Text(
                content,
                style: customTextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(260, 50),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                buttonText,
              ),
            ),
          ],
        );
      }),
    );
