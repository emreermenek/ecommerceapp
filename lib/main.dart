import 'package:ecommerce_app_en/consts/theme_data.dart';
import 'package:ecommerce_app_en/pages/inner_pages/products_details_page.dart';
import 'package:ecommerce_app_en/providers/theme_provider.dart';
import 'package:ecommerce_app_en/pages/home_page.dart';
import 'package:ecommerce_app_en/root_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return ThemeProvider();
          })
        ],
        child:
            Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-commerce App',
            theme: Themes.themeData(
                isDarkTheme: themeProvider.getIsDarkTheme, context: context),
            home: const RootPage(),
            routes: {
              ProductDetails.rootName: (context) => const ProductDetails()
            },
          );
        }));
  }
}
