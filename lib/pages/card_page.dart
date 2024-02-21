import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:ecommerce_app_en/widgets/empty_card_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EmptyCardWidget(
            image: ImagesManager.shoppingBasket,
            title: "WHOPPSS",
            subtitle1: "Your card is empty!",
            subtitle2: "You might want to look for new products",
            buttonText: "Search Products",
            func: () {}));
  }
}
