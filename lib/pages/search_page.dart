import 'package:ecommerce_app_en/models/product_model.dart';
import 'package:ecommerce_app_en/providers/product_provider.dart';
import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:ecommerce_app_en/widgets/products/product_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  static const String rootName = "/search_page";
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

  List<ProductModel> searchedProducts = [];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    List<ProductModel> productList = passedCategory == null
        ? productProvider.getProducts
        : productProvider.findByCategory(categoryName: passedCategory);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 40,
            leading: Image.asset(ImagesManager.shoppingBasket),
            title:
                SubtitleTextWidget(label: passedCategory ?? "Search Products"),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.delete_forever))
            ],
          ),
          body: productList.isEmpty
              ? const Center(
                  child: TitleTextWidget(label: "No product found"),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "Search",
                            prefixIcon: const Icon(
                              Icons.search,
                            ),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  searchController.clear();
                                  FocusScope.of(context).unfocus();
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                ))),
                        /*  onChanged: (product) {
                          setState(() {
                            searchedProducts =
                                productProvider.search(productName: product);
                          });
                        }, */
                        onSubmitted: (product) {
                          setState(() {
                            searchedProducts =
                                productProvider.search(productName: product);
                          });
                        },
                      ),
                      if (searchController.text.isNotEmpty &&
                          searchedProducts.isEmpty) ...[
                        const Center(
                          child: TitleTextWidget(label: "No product found"),
                        )
                      ],
                      Expanded(
                        child: DynamicHeightGridView(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 12,
                            builder: (context, index) {
                              return ProductsWidget(
                                productId: searchController.text.isNotEmpty
                                    ? searchedProducts[index].productId
                                    : productList[index].productId,
                              );
                            },
                            itemCount: searchController.text.isNotEmpty
                                ? searchedProducts.length
                                : productList.length,
                            crossAxisCount: 2),
                      ),
                    ],
                  ),
                )),
    );
  }
}
