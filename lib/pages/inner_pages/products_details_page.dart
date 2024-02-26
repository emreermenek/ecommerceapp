import 'package:ecommerce_app_en/consts/app_consts.dart';
import 'package:ecommerce_app_en/widgets/app_name_text_widget.dart';
import 'package:ecommerce_app_en/widgets/products/material_button_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  static const String rootName = "/products";
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const AppNameTextWidget(title: "Best Shop"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: FancyShimmerImage(
                  imageUrl: AppConstants.nikeShoe,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: Text(
                      "Title" * 15,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Flexible(
                    child: SubtitleTextWidget(
                      label: "1600\$",
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  MaterialButtonWidget(
                    size: 22,
                    padding: 9,
                    color: Colors.lightBlue.shade300,
                    borderRadius: 25,
                    icon: Icons.favorite_border_outlined,
                  ),
                  SizedBox(
                    width: size.width * 0.2,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_basket_outlined),
                        label: const SubtitleTextWidget(label: "Add to cart")),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                  alignment: Alignment.topLeft,
                  child:
                      FittedBox(child: TitleTextWidget(label: "Description"))),
              const SizedBox(
                height: 15,
              ),
              SubtitleTextWidget(label: "Title" * 150),
            ],
          ),
        ),
      ),
    );
  }
}
