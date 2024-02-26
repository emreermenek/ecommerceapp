import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {},
        icon: Image.asset(
          ImagesManager.googleLogo,
          width: 30,
          height: 30,
        ),
        label: FittedBox(
          child: const SubtitleTextWidget(
            label: "Connect using Google",
            maxLines: 1,
          ),
        ));
  }
}