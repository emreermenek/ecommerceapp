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
        leading: Image.asset(ImagesManager.shoppingBasket),
        title: SubtitleTextWidget(lable: "Profile Page"),
      ),
      body: Column(
        children: [
          const Visibility(
            visible: false,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SubtitleTextWidget(
                  lable: "Please login to have unlimited access!"),
            ),
          ),
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onBackground,
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
                        lable: "emreermenek1234@gmail.com",
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
                  func: () {},
                ),
                CustomListTileWidget(
                  image: ImagesManager.recent,
                  title: "Viewed Recent",
                  func: () {},
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
                            lable: "Dark Theme",
                            fontSize: 14,
                          )
                        : const SubtitleTextWidget(
                            lable: "Dark Theme",
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
                    onPressed: () {},
                    child: const SubtitleTextWidget(
                      lable: "Logout",
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
