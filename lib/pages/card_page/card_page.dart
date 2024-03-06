import 'package:ecommerce_app_en/pages/card_page/bottom_checkout_widget.dart';
import 'package:ecommerce_app_en/pages/card_page/card_widget.dart';
import 'package:ecommerce_app_en/providers/card_provider.dart';
import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:ecommerce_app_en/widgets/empty_card_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    return cardProvider.getCardItems.isEmpty
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
              title: SubtitleTextWidget(
                  label: "Card(${cardProvider.getCardItems.length})"),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete_forever))
              ],
            ),
            body: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cardProvider.getCardItems.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                      value: cardProvider.getCardItems.values.toList()[index],
                      child: const CardWidget());
                }));
  }
}
