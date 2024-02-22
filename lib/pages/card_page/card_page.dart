import 'package:ecommerce_app_en/pages/card_page/bottom_checkout_widget.dart';
import 'package:ecommerce_app_en/pages/card_page/card_widget.dart';
import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:ecommerce_app_en/widgets/empty_card_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyCardWidget(
                image: ImagesManager.shoppingBasket,
                title: "WHOPPSS",
                subtitle1: "Your card is empty!",
                subtitle2: "You might want to look for new products",
                buttonText: "Search Products",
                func: () {}))
        : Scaffold(
            bottomNavigationBar: const BottomCheckoutWidget(),
            appBar: AppBar(
              toolbarHeight: 40,
              leading: Image.asset(ImagesManager.shoppingBasket),
              title: const SubtitleTextWidget(label: "Card(7)"),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete_forever))
              ],
            ),
            body: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CardWidget();
                }));
  }
}
