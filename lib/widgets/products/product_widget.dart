import 'package:ecommerce_app_en/consts/app_consts.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              imageUrl: AppConstants.nikeShoe,
              height: size.height * 0.25,
              width: double.infinity,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 5,
                child: TitleTextWidget(
                  label: "Nike Shoe",
                  fontSize: 16,
                  maxLines: 2,
                ),
              ),
              Flexible(
                flex: 2,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined)),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: SubtitleTextWidget(
                  label: "1600\$",
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
              Material(
                  color: Colors.lightBlue.shade300,
                  borderRadius: BorderRadius.circular(25),
                  child: InkWell(
                      splashColor: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(5.5),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 20,
                        ),
                      )))
            ],
          )
        ],
      ),
    );
  }
}
