import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';

class BottomCheckoutWidget extends StatelessWidget {
  const BottomCheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: const BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTextWidget(
                      label: "Total(6 Products/9 items)",
                      fontSize: 16,
                    ),
                    Spacer(),
                    SubtitleTextWidget(
                      label: "16\$",
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const SubtitleTextWidget(
                  label: "Checkout",
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
