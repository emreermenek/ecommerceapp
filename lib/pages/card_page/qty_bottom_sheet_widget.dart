import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

class QuantityBottomSheetWidget extends StatelessWidget {
  const QuantityBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 50,
            height: 4,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(25)),
          ),
        ),
        Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 25,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SubtitleTextWidget(label: "${index + 1}"),
                  )),
                );
              }),
        ),
      ],
    );
  }
}
