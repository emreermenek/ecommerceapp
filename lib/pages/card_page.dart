import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TitleTextWidget(label: "Card Page"),
      ),
    );
  }
}
