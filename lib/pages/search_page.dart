import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 40,
            leading: Image.asset(ImagesManager.shoppingBasket),
            title: const SubtitleTextWidget(label: "Search Products"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            searchController.clear();
                            FocusScope.of(context).unfocus();
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          ))),
                )
              ],
            ),
          )),
    );
  }
}
