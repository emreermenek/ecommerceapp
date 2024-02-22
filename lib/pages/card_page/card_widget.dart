import 'package:ecommerce_app_en/pages/card_page/qty_bottom_sheet_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  imageUrl:
                      'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/e93db408-ecf6-4982-b0d0-13a756c9b8c2/pegasus-40-mens-road-running-shoes-zD8H1c.png',
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IntrinsicWidth(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: const TitleTextWidget(
                            label: "Nike Shoe",
                            maxLines: 2,
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_circle_rounded),
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.favorite_border_outlined)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SubtitleTextWidget(
                          label: "16\$",
                          color: Colors.blue,
                        ),
                        const Spacer(),
                        OutlinedButton.icon(
                            onPressed: () async {
                              await showModalBottomSheet(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  context: context,
                                  builder: (context) {
                                    return QuantityBottomSheetWidget();
                                  });
                            },
                            icon: const Icon(Icons.arrow_drop_down),
                            label: const SubtitleTextWidget(
                              label: "Qty: 6",
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
