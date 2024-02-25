import 'package:ecommerce_app_en/consts/app_consts.dart';
import 'package:ecommerce_app_en/providers/theme_provider.dart';
import 'package:ecommerce_app_en/widgets/products/ctg_rounded_widget.dart';
import 'package:ecommerce_app_en/widgets/products/latest_arrival.dart';
import 'package:ecommerce_app_en/widgets/products/product_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

import '../services/images_manager.dart';
import '../widgets/app_name_text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: Image.asset(ImagesManager.shoppingCart),
        title: const AppNameTextWidget(title: "Best Shop"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: size.height * 0.25,
                child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        AppConstants.bannerImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                    autoplay: true,
                    itemCount: AppConstants.bannerImages.length,
                    pagination: const SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            activeColor: Colors.red))),
              ),
              const SizedBox(
                height: 15,
              ),
              const TitleTextWidget(label: "Latest Products"),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 18,
                    itemBuilder: (context, index) {
                      return const LatestArrivalProductWidget();
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              const TitleTextWidget(label: "Categories"),
              const SizedBox(
                height: 15,
              ),
              GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  children: List.generate(AppConstants.categoriesList.length,
                      (index) {
                    return CategoriesRoundedWidget(
                        image: AppConstants.categoriesList[index].image,
                        label: AppConstants.categoriesList[index].name);
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
