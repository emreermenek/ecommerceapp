import 'package:ecommerce_app_en/providers/theme_provider.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TitleTextWidget(label: "Title"),
          const SubtitleTextWidget(lable: "Subtitle Text"),
          ElevatedButton(onPressed: () {}, child: const Text("ss")),
          SwitchListTile(
              title: themeProvider.getIsDarkTheme
                  ? const Text("Dark Theme")
                  : const Text("Light Theme"),
              value: themeProvider.getIsDarkTheme,
              onChanged: (value) {
                themeProvider.setDarkTheme(value);
              }),
        ],
      ),
    ));
  }
}
