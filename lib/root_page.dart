import 'package:ecommerce_app_en/pages/card_page.dart';
import 'package:ecommerce_app_en/pages/home_page.dart';
import 'package:ecommerce_app_en/pages/profile_page.dart';
import 'package:ecommerce_app_en/pages/search_page.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  late List<Widget> pages;
  late PageController controller;
  @override
  void initState() {
    super.initState();
    pages = const [HomePage(), SearchPage(), CardPage(), ProfilePage()];
    controller = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          height: kBottomNavigationBarHeight,
          selectedIndex: currentPage,
          onDestinationSelected: (index) {
            setState(() {
              currentPage = index;
            });
            controller.jumpToPage(currentPage);
          },
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(Icons.home_filled),
                icon: Icon(Icons.home_outlined),
                label: 'Home'),
            NavigationDestination(
                selectedIcon: Icon(Icons.search),
                icon: Icon(Icons.search_outlined),
                label: 'Search'),
            NavigationDestination(
                selectedIcon: Icon(Icons.credit_card),
                icon: Icon(Icons.credit_card_outlined),
                label: 'Card'),
            NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outlined),
                label: 'Profile'),
          ]),
    );
  }
}
