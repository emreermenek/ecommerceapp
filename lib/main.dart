import 'package:ecommerce_app_en/consts/theme_data.dart';
import 'package:ecommerce_app_en/firebase_options.dart';
import 'package:ecommerce_app_en/models/viewed_recently_model.dart';
import 'package:ecommerce_app_en/pages/auth/forgot_password_page.dart';
import 'package:ecommerce_app_en/pages/auth/register_page.dart';
import 'package:ecommerce_app_en/pages/home_page.dart';
import 'package:ecommerce_app_en/pages/inner_pages/orders/order_page.dart';
import 'package:ecommerce_app_en/pages/inner_pages/products_details_page.dart';
import 'package:ecommerce_app_en/pages/inner_pages/viewed_recently.dart';
import 'package:ecommerce_app_en/pages/inner_pages/wishlist.dart';
import 'package:ecommerce_app_en/pages/auth/login_page.dart';
import 'package:ecommerce_app_en/pages/search_page.dart';
import 'package:ecommerce_app_en/providers/card_provider.dart';
import 'package:ecommerce_app_en/providers/user_provider.dart';
import 'package:ecommerce_app_en/providers/viewed_recently_provider.dart';
import 'package:ecommerce_app_en/providers/product_provider.dart';
import 'package:ecommerce_app_en/providers/theme_provider.dart';
import 'package:ecommerce_app_en/providers/wishlist_provider.dart';
import 'package:ecommerce_app_en/root_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return ThemeProvider();
          }),
          ChangeNotifierProvider(
            create: (_) {
              return ProductProvider();
            },
          ),
          ChangeNotifierProvider(create: (_) {
            return CardProvider();
          }),
          ChangeNotifierProvider(
            create: (_) {
              return WishlistProvider();
            },
          ),
          ChangeNotifierProvider(create: (_) {
            return ViewedRecentlyProvider();
          }),
          ChangeNotifierProvider(create: (_) {
            return UserProvider();
          }),
        ],
        child:
            Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-commerce App',
            theme: Themes.themeData(
                isDarkTheme: themeProvider.getIsDarkTheme, context: context),
            home: const LoginPage(),
            routes: {
              RootPage.rootName: (context) => const RootPage(),
              ProductDetails.rootName: (context) => const ProductDetails(),
              ViewedRecentlyScreen.rootName: (context) =>
                  const ViewedRecentlyScreen(),
              WishlistPage.rootName: (context) => const WishlistPage(),
              RegisterPage.rootName: (context) => const RegisterPage(),
              OrderPage.rootName: (context) => const OrderPage(),
              ForgotPasswordPage.rootName: (context) =>
                  const ForgotPasswordPage(),
              SearchPage.rootName: (context) => const SearchPage(),
              LoginPage.rootName: (context) => const LoginPage(),
            },
          );
        }));
  }
}
