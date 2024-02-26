import 'package:ecommerce_app_en/pages/inner_pages/viewed_recently.dart';
import 'package:ecommerce_app_en/pages/inner_pages/wishlist.dart';
import 'package:ecommerce_app_en/services/app_functions.dart';
import 'package:ecommerce_app_en/widgets/app_name_text_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../services/images_manager.dart';
import '../widgets/customlisttile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: Image.asset(ImagesManager.shoppingCart),
        title: const AppNameTextWidget(title: "Best Shop"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Visibility(
              visible: false,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: SubtitleTextWidget(
                    label: "Please login to have unlimited access!"),
              ),
            ),
            Visibility(
              visible: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: themeProvider.getIsDarkTheme
                                ? Colors.white
                                : Colors.black,
                            width: 2,
                          ),
                          image: const DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"))),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextWidget(label: "Emre Ermenek"),
                        SubtitleTextWidget(
                          label: "emreermenek1234@gmail.com",
                          fontSize: 16,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleTextWidget(
                    label: "General",
                    fontSize: 18,
                  ),
                  CustomListTileWidget(
                    image: ImagesManager.orderSvg,
                    title: "All Orders",
                    func: () {},
                  ),
                  CustomListTileWidget(
                    image: ImagesManager.wishlistSvg,
                    title: "Wishlist",
                    func: () {
                      Navigator.pushNamed(context, WishlistPage.rootName);
                    },
                  ),
                  CustomListTileWidget(
                    image: ImagesManager.recent,
                    title: "Viewed Recent",
                    func: () {
                      Navigator.pushNamed(
                          context, ViewedRecentlyScreen.rootName);
                    },
                  ),
                  CustomListTileWidget(
                    image: ImagesManager.address,
                    title: "Address",
                    func: () {},
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TitleTextWidget(
                    label: "Settings",
                    fontSize: 18,
                  ),
                  SwitchListTile(
                      secondary: Image.asset(
                        ImagesManager.theme,
                        height: 32,
                        width: 32,
                      ),
                      title: themeProvider.getIsDarkTheme
                          ? const SubtitleTextWidget(
                              label: "Dark Theme",
                              fontSize: 14,
                            )
                          : const SubtitleTextWidget(
                              label: "Dark Theme",
                              fontSize: 14,
                            ),
                      value: themeProvider.getIsDarkTheme,
                      onChanged: (value) {
                        themeProvider.setDarkTheme(value);
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        AppFunctions.showErrorOrWarningDialog(
                            context: context,
                            func: () {},
                            title: "Are you sure?",
                            isError: false);
                      },
                      child: const SubtitleTextWidget(
                        label: "Logout",
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
