import 'package:ecommerce_app_en/consts/app_consts.dart';
import 'package:ecommerce_app_en/loading_manager.dart';
import 'package:ecommerce_app_en/models/user_model.dart';
import 'package:ecommerce_app_en/pages/auth/login_page.dart';
import 'package:ecommerce_app_en/pages/inner_pages/orders/order_page.dart';
import 'package:ecommerce_app_en/pages/inner_pages/viewed_recently.dart';
import 'package:ecommerce_app_en/pages/inner_pages/wishlist.dart';
import 'package:ecommerce_app_en/providers/user_provider.dart';
import 'package:ecommerce_app_en/services/app_functions.dart';
import 'package:ecommerce_app_en/widgets/app_name_text_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../services/images_manager.dart';
import '../widgets/customlisttile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final User? _user = FirebaseAuth.instance.currentUser;
  UserModel? userModel;
  bool _isLoading = true;

  Future<void> fetchUserInfo() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      setState(() {
        _isLoading = true;
      });
      userModel = await userProvider.fetchUserModel();
    } catch (error) {
      if (!mounted) return;
      await AppFunctions.showErrorOrWarningDialog(
          context: context, func: () {}, title: error.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: Image.asset(ImagesManager.shoppingCart),
        title: const AppNameTextWidget(title: "Best Shop"),
      ),
      body: LoadingManager(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Visibility(
                visible: userModel == null ? true : false,
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Center(
                    child: SubtitleTextWidget(
                        label: "Please login to have unlimited access!"),
                  ),
                ),
              ),
              userModel == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
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
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(userModel!.userImage))),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleTextWidget(label: userModel!.userName),
                              SubtitleTextWidget(
                                label: userModel!.userEmail,
                                fontSize: 16,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
              Visibility(
                visible: userModel == null ? false : true,
                child: Padding(
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
                        func: () {
                          Navigator.pushNamed(context, OrderPage.rootName);
                        },
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
                            if (_user == null) {
                              Navigator.pushNamed(context, LoginPage.rootName);
                            } else {
                              AppFunctions.showErrorOrWarningDialog(
                                  context: context,
                                  func: () {},
                                  title: "Are you sure?",
                                  isError: false);
                            }
                          },
                          child: SubtitleTextWidget(
                            label: _user == null ? "Login " : "Logout",
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
