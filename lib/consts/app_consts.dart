import 'package:ecommerce_app_en/models/categories_model.dart';

import '../services/images_manager.dart';

class AppConstants {
  static const String nikeShoe =
      "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/e93db408-ecf6-4982-b0d0-13a756c9b8c2/pegasus-40-mens-road-running-shoes-zD8H1c.png";
  static const List<String> bannerImages = [
    ImagesManager.banner1,
    ImagesManager.banner2
  ];

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
        id: ImagesManager.bookImage,
        name: "Books",
        image: ImagesManager.bookImage),
    CategoriesModel(
        id: ImagesManager.cosmetics,
        name: "Cosmetics",
        image: ImagesManager.cosmetics),
    CategoriesModel(
        id: ImagesManager.electronics,
        name: "Accessories",
        image: ImagesManager.electronics),
    CategoriesModel(
        id: ImagesManager.fashion,
        name: "Fashion",
        image: ImagesManager.fashion),
    CategoriesModel(
        id: ImagesManager.mobiles,
        name: "Phones",
        image: ImagesManager.mobiles),
    CategoriesModel(
        id: ImagesManager.pc, name: "Laptops", image: ImagesManager.pc),
    CategoriesModel(
        id: ImagesManager.shoes, name: "Shoes", image: ImagesManager.shoes),
    CategoriesModel(
        id: ImagesManager.watch, name: "Watches", image: ImagesManager.watch),
  ];
}
