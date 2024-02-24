import 'package:ecommerce_app_en/consts/app_consts.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class LatestArrivalProductWidget extends StatelessWidget {
  const LatestArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.height * 0.40,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  imageUrl: AppConstants.nikeShoe,
                  height: double.infinity,
                  width: size.width * 0.3,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SubtitleTextWidget(
                    label: "Nike Shoe",
                    maxLines: 2,
                    fontSize: 18,
                  ),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.checklist)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_outlined)),
                      ],
                    ),
                  ),
                  const FittedBox(child: SubtitleTextWidget(label: "1600\$"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
