import 'package:ecommerce_app_en/pages/search_page.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoriesRoundedWidget extends StatelessWidget {
  const CategoriesRoundedWidget(
      {super.key, required this.image, required this.label});

  final String image;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, SearchPage.rootName, arguments: label);
        },
        child: Column(
          children: [
            Image.asset(
              image,
              height: 50,
              width: 50,
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: TitleTextWidget(
                label: label,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
