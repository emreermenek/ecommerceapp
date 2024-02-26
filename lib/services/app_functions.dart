import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';

class AppFunctions {
  static Future<void> showErrorOrWarningDialog({
    required BuildContext context,
    required Function func,
    bool isError = true,
    required String title,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isError ? ImagesManager.error : ImagesManager.warning,
                  width: 60,
                  height: 60,
                ),
                const SizedBox(
                  height: 15,
                ),
                TitleTextWidget(
                  label: title,
                  color: Colors.blue,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: !isError,
                      child: TextButton(
                          onPressed: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                          },
                          child: const TitleTextWidget(
                            label: "Cancel",
                            color: Colors.green,
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          func();
                        },
                        child: const TitleTextWidget(
                          label: "OK",
                          color: Colors.red,
                        )),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
