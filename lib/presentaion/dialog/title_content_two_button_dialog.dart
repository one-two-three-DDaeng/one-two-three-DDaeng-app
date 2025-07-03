import 'package:flutter/material.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';

Future<dynamic> titleContentTwoButtonDialog({
  required BuildContext context,
  required String content,
  required String buttonText1,
  required String buttonText2,
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
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                      backgroundColor: CustomColor.orangeColor,
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      buttonText1,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(
                      buttonText2,
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      }),
    );
