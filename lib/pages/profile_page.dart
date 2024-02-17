import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ss")),
      body: const Center(
        child: TitleTextWidget(label: 'Profile Page'),
      ),
    );
  }
}
